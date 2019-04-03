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
}
