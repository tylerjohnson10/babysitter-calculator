//
//  FamilyStrategy.swift
//  BabysitterCalculator
//
//  Created by Tyler Johnson on 4/4/19.
//

import Foundation

enum FamilyStrategy {
    /// Family A's payment schedule, in chronological order for a day.
    private static let familyAPaymentShedule = [20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15]
    /// Family B's payment schedule, in chronological order for a day.
    private static let familyBPaymentShedule = [16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 12, 12, 12, 8, 8]
    /// Family C's payment schedule, in chronological order for a day.
    private static let familyCPaymentShedule = [15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 21, 21, 21, 15, 15, 15]

    case a
    case b
    case c

    /// An array of 24 integers which indicates the amount the family pays for each hour of the day.
    /// Pay between midnight and 1am is located at index 0, while pay between 11pm and midnight is
    /// at index 23.
    var paymentSchedule: [Int] {
        switch self {
        case .a:
            return FamilyStrategy.familyAPaymentShedule
        case .b:
            return FamilyStrategy.familyBPaymentShedule
        case .c:
            return FamilyStrategy.familyCPaymentShedule
        }
    }
}
