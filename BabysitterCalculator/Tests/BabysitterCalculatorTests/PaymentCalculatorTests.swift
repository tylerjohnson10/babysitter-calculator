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

        var dateComponents = DateComponents()
        dateComponents.hour = 1

        let startTime = Date()
        let endTime = Calendar.current.date(byAdding: dateComponents, to: startTime)!
        let result = unitUnderTest.calculatePayment(forStartTime: startTime, endTime: endTime)

        guard case .success(let payment) = result else {
            XCTFail("Expected success, got failure")
            return
        }

        XCTAssertEqual(payment, expectedPayment)
    }

    func testItReturnsAnErrorWhenTheEndTimeIsBeforeTheStartTime() {
        let expectedError: PaymentCalculationError = .endTimeIsBeforeStartTime

        var dateComponents = DateComponents()
        dateComponents.hour = -1

        let startTime = Date()
        let endTime = Calendar.current.date(byAdding: dateComponents, to: startTime)!
        let result = unitUnderTest.calculatePayment(forStartTime: startTime, endTime: endTime)

        guard case .failure(let actualError) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(actualError, expectedError)
    }
}
