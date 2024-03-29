//
//  Shift.swift
//  BabysitterCalculator
//
//  Created by Tyler Johnson on 4/2/19.
//

import Foundation

enum ShiftValidationError: Error {
    /// An invalid date was provided
    case invalidEntry(message: String)
}

/**
 Represents a shift worked.
 */
struct Shift {
    private static let validEndingHours: Set = [0, 1, 2, 3, 4, 17, 18, 19, 20, 21, 22, 23]
    private static let validStartingHours: Set = [0, 1, 2, 3, 17, 18, 19, 20, 21, 22, 23]

    /// Creates an integer, 0 through 23, to represent an hour represented as a string.
    private static func hour(from string: String) -> Int? {
        switch string {
        case "12am":    return 0
        case "1am":     return 1
        case "2am":     return 2
        case "3am":     return 3
        case "4am":     return 4
        case "5am":     return 5
        case "6am":     return 6
        case "7am":     return 7
        case "8am":     return 8
        case "9am":     return 9
        case "10am":    return 10
        case "11am":    return 11
        case "12pm":    return 12
        case "1pm":     return 13
        case "2pm":     return 14
        case "3pm":     return 15
        case "4pm":     return 16
        case "5pm":     return 17
        case "6pm":     return 18
        case "7pm":     return 19
        case "8pm":     return 20
        case "9pm":     return 21
        case "10pm":    return 22
        case "11pm":    return 23
        default:        return nil
        }
    }

    /**
     Creates a new shift.

     - parameters:
     - startTimeString: The start time of the shift in a string representation, such as 5pm.
     - endTimeString: The end time of the shift in a string representation, such as 3am.

     - returns: A new instance of a Shift if the provided times are valid. If the end time comes
     before the start time, it is assumed that the ending date is the following day on the
     calendar.
     */
    static func makeShift(startTimeString: String, endTimeString: String) throws -> Shift {
        let startDate: Date
        let endDate: Date

        switch (hour(from: startTimeString), hour(from: endTimeString)) {
        case (nil, nil):
            throw ShiftValidationError.invalidEntry(message: "Invalid start time and end time: \(startTimeString), \(endTimeString). Please format input, for example, as 5pm.")
        case (nil, _):
            throw ShiftValidationError.invalidEntry(message: "Invalid start time: \(startTimeString). Please format input, for example, as 5pm.")
        case (_, nil):
            throw ShiftValidationError.invalidEntry(message: "Invalid end time: \(endTimeString). Please format input, for example, as 5pm.")
        case (.some(let startHour), .some(let endHour)):
            try validate(startingHour: startHour)
            try validate(endingHour: endHour)

            let startComponents = DateComponents(calendar: Calendar.current, hour: startHour)
            let endComponents = DateComponents(calendar: Calendar.current, hour: endHour)

            let dateOfEnding = endHour - startHour > 0 ? Date.startOfToday : Date.startOfTomorrow

            startDate = Calendar.current.date(byAdding: startComponents, to: Date.startOfToday)!
            endDate = Calendar.current.date(byAdding: endComponents, to: dateOfEnding)!

            try validateDateRange(startingDate: startDate, endingDate: endDate)
        }

        return Shift(startDate: startDate, endDate: endDate)
    }

    /// The end time of the shift.
    let endDate: Date

    /// The start time of the shift.
    let startDate: Date

    private init(startDate: Date, endDate: Date) {
        self.endDate = endDate
        self.startDate = startDate
    }
}

private extension Shift {
    /**
     Validates the start time is not too early in the day.

     - parameter startingHour: The time the babysitter is starting work.

     returns: Throws an error is the start time is invalid
     */
    static func validate(startingHour hour: Int) throws {
        guard validStartingHours.contains(hour) else {
            throw ShiftValidationError.invalidEntry(message: "Start time is too early. Please enter a time of 5pm or later.")
        }
    }

    /**
     Validates the end time is not too late.

     - parameter endingHour: The time the babysitter is done working.

     returns: Throws an error is the end time is invalid
     */
    static func validate(endingHour hour: Int) throws {
        guard validEndingHours.contains(hour) else {
            throw ShiftValidationError.invalidEntry(message: "End time is too late. Please enter a time of 4am or earlier.")
        }
    }

    /**
     Validates the time range is valid.

     With the constraints of starting no earlier than 5pm and ending no later than 4am, we know a
     12 hour shift is invalid. Therefore, entering start/end times like 5pm/5pm and 8pm/5pm will
     be invalidate by this function because the shift length will be longer than 12 hours.

     - parameter startingHour: The time the babysitter starts working.
     - parameter endingHour: The time the babysitter is done working.

     returns: Throws an error is the end time is invalid
     */
    static func validateDateRange(startingDate startDate: Date, endingDate endDate: Date) throws {
        let hoursWorked = endDate.timeIntervalSince(startDate) / 60 / 60
        guard hoursWorked < 12 else {
            throw ShiftValidationError.invalidEntry(message: "Looks like you've entered an invalid date range. Please verify that your start time occurs before your end time.")
        }
    }
}
