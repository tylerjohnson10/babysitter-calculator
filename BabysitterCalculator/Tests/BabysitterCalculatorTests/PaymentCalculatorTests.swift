//
//  PaymentCalculatorTests.swift
//  BabysitterCalculatorTests
//
//  Created by Tyler Johnson on 4/1/19.
//

import XCTest
@testable import BabysitterCalculator

class PaymentCalculatorTests: XCTestCase {
    let unitUnderTest = PaymentCalculator(strategy: .a)

    func testItCalculatesTheCorrectPaymentForOneHour() {
        let expectedPayment = 0

        var dateComponents = DateComponents()
        dateComponents.hour = 1

        let shift = try! Shift.makeShift(startTimeString: "5pm", endTimeString: "4am")
        let result = unitUnderTest.calculatePayment(forShift: shift)

        guard case .success(let actualPayment) = result else {
            XCTFail("Expected success, got failure")
            return
        }

        XCTAssertEqual(actualPayment, expectedPayment)
    }
}
