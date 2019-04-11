import Foundation

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

let calculator = PaymentCalculator(strategy: .a)

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
