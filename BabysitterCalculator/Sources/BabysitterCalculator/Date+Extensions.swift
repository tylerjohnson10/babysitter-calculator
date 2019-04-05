//
//  Date+Extensions.swift
//  BabysitterCalculator
//
//  Created by Tyler Johnson on 4/5/19.
//

import Foundation

extension Date {
    static var startOfToday: Date {
        return Calendar.current.startOfDay(for: Date())
    }

    static var startOfTomorrow: Date {
        return Calendar.current.startOfDay(for: twentyFourHoursFromNow)
    }

    private static var twentyFourHoursFromNow: Date {
        let oneDay = DateComponents(hour: 24)
        return Calendar.current.date(byAdding: oneDay, to: Date())!
    }
}
