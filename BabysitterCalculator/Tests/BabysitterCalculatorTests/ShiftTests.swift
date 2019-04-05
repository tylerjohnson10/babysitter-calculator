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
        XCTAssertThrowsError(try Shift.makeShift(startTimeString: "4pm", endTimeString: "9pm"))
    }

    func testItDoesNotThrowAnErrorIfTheStartTimeIsNotTooEarly() {
        XCTAssertNoThrow(try Shift.makeShift(startTimeString: "5pm", endTimeString: "9pm"))
    }

    func testItThrowsAnErrorIfTheEndTimeIsTooLate() {
        XCTAssertThrowsError(try Shift.makeShift(startTimeString: "5pm", endTimeString: "5am"))
    }

    func testItDoesNotThrowAnErrorIfTheEndTimeIsNotTooLate() {
        XCTAssertNoThrow(try Shift.makeShift(startTimeString: "5pm", endTimeString: "4am"))
    }
}
