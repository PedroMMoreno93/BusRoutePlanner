//
//  TripStatus.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/* TripStatus */
/// Holds a set of possible states for a trip:
/// 
/// Defined states:
/// - Ongoing
/// - Scheduled
/// - Cancelled
/// - Finalized
/// - Unknown
///
enum TripStatus: String {
    case ongoing
    case scheduled
    case cancelled
    case finalized
    case unknown
}

extension TripStatus {
    /* color */
    /// Color representation of the trip's status
    ///
    ///     - ongoing: blue
    ///     - scheduled: yellow
    ///     - cancelled: red
    ///     - finalized: green
    ///     - unknown: gray
    ///
    /// - Returns: The corresponding system color for each state
    /// 
    var color: Color {
        switch self {
        case .ongoing:
            return .blue

        case .scheduled:
            return .yellow

        case .cancelled:
            return .red

        case .finalized:
            return .green

        case .unknown:
            return .gray
        }
    }
}

extension TripStatus {
    /* systemIcon */
    /// SF Symbol name.
    ///
    ///     - ongoing: arrow.left.arrow.right.circle.fill
    ///     - scheduled: calendar.badge.clock
    ///     - cancelled: xmark.circle.fill
    ///     - finalized: checkmark.circle.fill
    ///     - unknown: questionmark.circle.fill
    ///
    /// - Returns: The string identifier for that symbol
    ///
    var systemIcon: String {
        switch self {
        case .ongoing:
            return "arrow.left.arrow.right.circle.fill"

        case .scheduled:
            return "calendar.badge.clock"

        case .cancelled:
            return "xmark.circle.fill"

        case .finalized:
            return "checkmark.circle.fill"

        case .unknown:
            return "questionmark.circle.fill"
        }
    }
}
