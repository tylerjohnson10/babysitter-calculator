//
//  PaymentCalculator.swift
//  BabysitterCalculator
//
//  Created by Tyler Johnson on 4/1/19.
//

import Foundation

enum PaymentCalculationError: Error {
    case endTimeIsBeforeStartTime
}

public final class PaymentCalculator {
    private let familyStrategy: FamilyStrategy

    init(strategy: FamilyStrategy) {
        self.familyStrategy = strategy
    }

    func calculatePayment(forShift shift: Shift) -> Result<Int, PaymentCalculationError> {
        var hoursWorked = [Bool](repeating: false, count: 24)
        let shiftTimeInterval = shift.endDate.timeIntervalSince(shift.startDate)
        let numberOfHoursWorked = Int(shiftTimeInterval / 60 / 60)

        let startHour = Calendar.current.dateComponents([.hour], from: shift.startDate).hour!

        for item in startHour..<startHour + numberOfHoursWorked {
            let index = item % 24
            hoursWorked[index] = true
        }

        let payment = zip(hoursWorked, familyStrategy.paymentSchedule).compactMap({ return $0 ? $1 : 0 }).reduce(0, { $0 + $1 })
        return .success(payment)
    }
}
