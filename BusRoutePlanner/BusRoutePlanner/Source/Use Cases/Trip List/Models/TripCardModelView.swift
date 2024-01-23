//
//  TripCardModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/// Model that holds the data needed by TripCardView
/// - Parameters:
///     - driverName: String
///     - origin: String
///     - destination: String
///     - status: TripStatus
///     - startTime: Date
///     - endTime: Date
struct TripCardModelView: Identifiable {
    let id = UUID()
    let driverName: String
    let origin: String
    let destination: String
    let status: TripStatus
    let startTime: Date
    let endTime: Date
    var endTimeString: String {
        return endTime.formatted(date: .omitted, time: .shortened)
    }
}

extension TripCardModelView {

    /// Ongoing trip mock model for previews
    ///
    /// - Parameters:
    ///     - driverName: Dominic Toretto
    ///     - origin: Rio de Janeiro
    ///     - destination: Tokyo
    ///     - status: .ongoing
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let previewOngoingTrip = TripCardModelView(
        driverName: "Dominic Toretto",
        origin: "Rio de Janeiro",
        destination: "Tokyo",
        status: .ongoing,
        startTime: .now,
        endTime: Date(timeInterval: 1200, since: .now)
    )

    /// Scheduled trip mock model for previews
    ///
    /// - Parameters:
    ///     - driverName: Letty Ortiz
    ///     - origin: Havana
    ///     - destination: Dubai
    ///     - status: .scheduled
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let previewShceduledTrip = TripCardModelView(
        driverName: "Letty Ortiz",
        origin: "Havana",
        destination: "Dubai",
        status: .scheduled,
        startTime: .now,
        endTime: Date(timeInterval: 1200, since: .now)
    )

    /// Cancelled trip mock model for previews
    ///
    /// - Parameters:
    ///     - driverName: Brian O'Conner
    ///     - origin: Los Angeles
    ///     - destination: London
    ///     - status: .cancelled
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let previewCancelledTrip = TripCardModelView(
        driverName: "Brian O'Conner",
        origin: "Los Angeles",
        destination: "London",
        status: .cancelled,
        startTime: .now,
        endTime: Date(timeInterval: 1200, since: .now)
    )

    /// Finalized trip mock model for previews
    ///
    /// - Parameters:
    ///     - driverName: Roman Pearce
    ///     - origin: New York City
    ///     - destination: Sydney
    ///     - status: .finalized
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let previewFinalizedTrip = TripCardModelView(
        driverName: "Jack Sparrow",
        origin: "New York City",
        destination: "Sydney",
        status: .finalized,
        startTime: .now,
        endTime: Date(timeInterval: 1200, since: .now)
    )
}
