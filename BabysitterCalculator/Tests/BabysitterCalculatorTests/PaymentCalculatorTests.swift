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

        let startDate = Calendar.current.date(bySetting: .hour, value: 17, of: Date())!
        let endDate = Calendar.current.date(byAdding: dateComponents, to: startDate)!
        let shift = try! Shift.makeShift(startDate: startDate, endDate: endDate)
        let result = unitUnderTest.calculatePayment(forShift: shift)

        guard case .success(let actualPayment) = result else {
            XCTFail("Expected success, got failure")
            return
        }

        XCTAssertEqual(actualPayment, expectedPayment)
    }
}
