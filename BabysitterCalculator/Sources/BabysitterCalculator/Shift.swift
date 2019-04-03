//
//  Shift.swift
//  BabysitterCalculator
//
//  Created by Tyler Johnson on 4/2/19.
//

import Foundation

enum ShiftValidationError: Error {
    /// Indicates the provided end time was earlier than the provided start time.
    case endTimeIsBeforeStartTime
    /// An invalid date was provided
    case invalidDate
    /// Indicates it is too early to start work
    case startTimeTooEarly
}

/**
 Represents a shift worked.
 */
struct Shift {
    private static let validEndingHours: Set = [0, 1, 2, 3, 4, 17, 18, 19, 20, 21, 22, 23, 24]
    private static let validStartingHours: Set = [0, 1, 2, 3, 17, 18, 19, 20, 21, 22, 23, 24]

    /**
     Creates a new shift.

     - parameters:
     - startDate: The start time of the shift.
     - endDate: The end time of the shift.
     - returns: Success if the start and end time are valid, else a failure indicating the
     validation that failed.
     */
    static func makeShift(startDate: Date, endDate: Date) throws -> Shift {
        try validateTimeRange(from: startDate, to: endDate)
        try validate(startDate: startDate)

        return Shift(endDate: endDate, startDate: startDate)
    }

    /// The end time of the shift.
    let endDate: Date

    /// The start time of the shift.
    let startDate: Date
}

private extension Shift {
    private static func validateTimeRange(from startTime: Date, to endTime: Date) throws -> Void {
        let dateComponents = Calendar.current.dateComponents([.hour], from: startTime, to: endTime)
        guard let hoursWorked = dateComponents.hour, hoursWorked > 0 else {
            throw ShiftValidationError.endTimeIsBeforeStartTime
        }

        return ()
    }

    /**
     Validates the start time is not too early in the day.

     - parameter startTime: The time the babysitter is starting

     returns: .success if the provided startTime is valid
     */
    private static func validate(startDate: Date) throws -> Void {
        let dateComponents = Calendar.current.dateComponents([.hour], from: startDate)

        guard let hour = dateComponents.hour else {
            assertionFailure("The provided start date did not provide an hour")
            throw ShiftValidationError.invalidDate
        }

        guard validStartingHours.contains(hour) else {
            throw ShiftValidationError.startTimeTooEarly
        }

        return ()
    }
}
