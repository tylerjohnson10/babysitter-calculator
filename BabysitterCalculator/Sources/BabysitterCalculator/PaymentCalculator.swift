//
//  PaymentCalculator.swift
//  BabysitterCalculator
//
//  Created by Tyler Johnson on 4/1/19.
//

import Foundation

enum PaymentCalculationError: Error {
}

public final class PaymentCalculator {
    func calculatePayment() -> Result<Int, PaymentCalculationError> {
        return .success(0)
    }
}
