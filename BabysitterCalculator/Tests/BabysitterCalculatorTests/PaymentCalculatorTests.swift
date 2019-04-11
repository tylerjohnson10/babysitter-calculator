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

    /// Thrown when expecting a payment to be calculated successfully.
    struct UnexpectedFailureError: Error {}

    func calculateExpectedPayment(from startTimeString: String, to endTimeString: String) throws -> Int {
        let shift = try! Shift.makeShift(startTimeString: startTimeString, endTimeString: endTimeString)
        let result = unitUnderTest.calculatePayment(forShift: shift)

        guard case .success(let actualPayment) = result else {
            throw UnexpectedFailureError()
        }

        return actualPayment
    }

    func testItCalculatesTheCorrectPaymentFor5pmTo6pm() {
        let expectedPayment = 15
        do {
            let actualPayment = try calculateExpectedPayment(from: "5pm", to: "6pm")
            XCTAssertEqual(actualPayment, expectedPayment)
        } catch {
            XCTFail("Expected success, got an error: \(error)")
        }
    }

    func testItCalculatesTheCorrectPayementFor5pmToMidnight() {
        let expectedPayment = 105
        do {
            let actualPayment = try calculateExpectedPayment(from: "5pm", to: "12am")
            XCTAssertEqual(actualPayment, expectedPayment)
        } catch {
            XCTFail("Expected success, got an error: \(error)")
        }
    }

    func testItCalculatesTheCorrectPayementFor5pmTo4am() {
        let expectedPayment = 185
        do {
            let actualPayment = try calculateExpectedPayment(from: "5pm", to: "4am")
            XCTAssertEqual(actualPayment, expectedPayment)
        } catch {
            XCTFail("Expected success, got an error: \(error)")
        }
    }

    func testItCalculatesTheCorrectPayementForMidnightTo4am() {
        let expectedPayment = 80
        do {
            let actualPayment = try calculateExpectedPayment(from: "12am", to: "4am")
            XCTAssertEqual(actualPayment, expectedPayment)
        } catch {
            XCTFail("Expected success, got an error: \(error)")
        }
    }
}
