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
        return .success(0)
    }
}
