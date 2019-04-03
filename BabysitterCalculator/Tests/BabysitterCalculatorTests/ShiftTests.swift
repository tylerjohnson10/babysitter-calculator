//
//  ShiftTests.swift
//  BabysitterCalculatorTests
//
//  Created by Tyler Johnson on 4/2/19.
//

import XCTest
@testable import BabysitterCalculator

class ShiftTests: XCTestCase {
    func testItThrowsAnErrorIfTheStartTimeIsTooEarly() {
        var dateComponents = DateComponents()
        dateComponents.hour = 1

        let startDate = Calendar.current.date(bySetting: .hour, value: 12, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!

        XCTAssertThrowsError(try Shift.makeShift(startDate: startDate, endDate: endDate))
    }

    func testItDoesNotThrowAnErrorIfTheStartTimeIsNotTooEarly() {
        var dateComponents = DateComponents()
        dateComponents.hour = 1

        let startDate = Calendar.current.date(bySetting: .hour, value: 17, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!

        XCTAssertNoThrow(try Shift.makeShift(startDate: startDate, endDate: endDate))
    }

    func testItThrowsAnErrorIfTheEndTimeIsTooLate() {
        var dateComponents = DateComponents()
        dateComponents.hour = 12

        let startDate = Calendar.current.date(bySetting: .hour, value: 17, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!

        XCTAssertThrowsError(try Shift.makeShift(startDate: startDate, endDate: endDate))
    }

    func testItDoesNotThrowAnErrorIfTheEndTimeIsNotTooLate() {
        var dateComponents = DateComponents()
        dateComponents.hour = 8

        let startDate = Calendar.current.date(bySetting: .hour, value: 17, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!

        XCTAssertNoThrow(try Shift.makeShift(startDate: startDate, endDate: endDate))
    }

    func testItThrowsAnErrorIfTheEndTimeIsBeforeTheStartTime() {
        var dateComponents = DateComponents()
        dateComponents.hour = -1

        let startDate = Calendar.current.date(bySetting: .hour, value: 17, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!
        XCTAssertThrowsError(try Shift.makeShift(startDate: startDate, endDate: endDate))
    }

    func testItDoesNotThrowAnErrorIfTheStartTimeIsBeforeTheEndTime() {
        var dateComponents = DateComponents()
        dateComponents.hour = 1

        let startDate = Calendar.current.date(bySetting: .hour, value: 17, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!
        XCTAssertNoThrow(try Shift.makeShift(startDate: startDate, endDate: endDate))
    }
}
