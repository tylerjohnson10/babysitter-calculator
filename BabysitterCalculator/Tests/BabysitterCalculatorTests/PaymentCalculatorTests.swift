//
//  PaymentCalculatorTests.swift
//  BabysitterCalculatorTests
//
//  Created by Tyler Johnson on 4/1/19.
//

import XCTest
@testable import BabysitterCalculator

class PaymentCalculatorTests: XCTestCase {
    let unitUnderTest = PaymentCalculator()

    func testItCalculatesTheCorrectPaymentForOneHour() {
        let expectedPayment = 0

        let result = unitUnderTest.calculatePayment()

        guard case .success(let actualPayment) = result else {
            XCTFail("Expected success, got failure")
            return
        }

        XCTAssertEqual(actualPayment, expectedPayment)
    }
}
