import Foundation

var familyStrategy: FamilyStrategy?
let arguments = CommandLine.arguments
for (index, argument) in arguments.enumerated() {
    if "--family" == argument {
        let strategyArgument = arguments[index + 1]
        guard let strategy = FamilyStrategy(rawValue: strategyArgument) else {
            print("Enter the family you're working for using --family [a, b, c]")
            exit(1)
        }
        familyStrategy = strategy
    }
}

guard let familyStrategy = familyStrategy else {
    print("Enter the family you're working for using --family [a, b, c]")
    exit(1)
}

func getEntry() -> String? {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let string = String(data: inputData, encoding: String.Encoding.utf8)
    return string?.trimmingCharacters(in: CharacterSet.newlines)
}

print("Enter start hour: ")
guard let startingHourString = getEntry() else {
    print("Oops. Invalid start hour")
    exit(1)
}

print("Enter end hour: ")
guard let endingHourString = getEntry() else {
    print("Oops. Invalid end hour")
    exit(1)
}

let calculator = PaymentCalculator(strategy: familyStrategy)

do {
    let shift = try Shift.makeShift(startTimeString: startingHourString, endTimeString: endingHourString)

    switch calculator.calculatePayment(forShift: shift) {
    case .success(let payment):
        print("Payment: \(payment)")
    case .failure(let error):
        print("Error: \(error)")
    }
} catch ShiftValidationError.invalidEntry(message: let message) {
    print(message)
}
