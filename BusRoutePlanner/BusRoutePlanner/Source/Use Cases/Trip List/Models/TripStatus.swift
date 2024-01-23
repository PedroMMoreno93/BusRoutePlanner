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
///
enum TripStatus: String {
    case ongoing
    case scheduled
    case cancelled
    case finalized
}

extension TripStatus {
    /* color */
    /// Color representation of the trip's status
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
        }
    }
}

extension TripStatus {
    /* systemIcon */
    /// SF Symbol name
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
        }
    }
}
