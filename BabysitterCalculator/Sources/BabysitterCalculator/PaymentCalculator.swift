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
    func calculatePayment(forStartTime startTime: Date, endTime: Date) -> Result<Int, PaymentCalculationError> {
        let dateComponents = Calendar.current.dateComponents([.hour], from: startTime, to: endTime)
        guard let hoursWorked = dateComponents.hour, hoursWorked > 0 else {
            return .failure(.endTimeIsBeforeStartTime)
        }

        return .success(0)
    }
}
