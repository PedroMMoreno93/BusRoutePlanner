//
//  TestTripCardMocks.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//
import Foundation

@testable import BusRoutePlanner

extension TripCardModelView {

    /// Ongoing trip mock model for testing
    ///
    /// - Parameters:
    ///     - driverName: Dominic Toretto
    ///     - origin: Rio de Janeiro
    ///     - destination: Tokyo
    ///     - status: .ongoing
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let testingOngoingTrip = TripCardModelView(
        driverName: "Dominic Toretto",
        origin: "Rio de Janeiro",
        destination: "Tokyo",
        status: .ongoing,
        startTime: Date.dateFromString("2024-01-23 15:30") ?? .now,
        endTime: Date(timeInterval: 1200, since: Date.dateFromString("2024-01-23 15:30") ?? .now)
    )

    /// Scheduled trip mock model for testing
    ///
    /// - Parameters:
    ///     - driverName: Letty Ortiz
    ///     - origin: Havana
    ///     - destination: Dubai
    ///     - status: .scheduled
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let testingShceduledTrip = TripCardModelView(
        driverName: "Letty Ortiz",
        origin: "Havana",
        destination: "Dubai",
        status: .scheduled,
        startTime: .dateFromString("2024-01-23 15:30") ?? .now,
        endTime: Date(timeInterval: 1200, since: .dateFromString("2024-01-23 15:30") ?? .now)
    )

    /// Cancelled trip mock model for testing
    ///
    /// - Parameters:
    ///     - driverName: Brian O'Conner
    ///     - origin: Los Angeles
    ///     - destination: London
    ///     - status: .cancelled
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let testingCancelledTrip = TripCardModelView(
        driverName: "Brian O'Conner",
        origin: "Los Angeles",
        destination: "London",
        status: .cancelled,
        startTime: .dateFromString("2024-01-23 15:30") ?? .now,
        endTime: Date(timeInterval: 1200, since: .dateFromString("2024-01-23 15:30") ?? .now)
    )

    /// Finalized trip mock model for testing
    ///
    /// - Parameters:
    ///     - driverName: Roman Pearce
    ///     - origin: New York City
    ///     - destination: Sydney
    ///     - status: .finalized
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let testingFinalizedTrip = TripCardModelView(
        driverName: "Jack Sparrow",
        origin: "New York City",
        destination: "Sydney",
        status: .finalized,
        startTime: .dateFromString("2024-01-23 18:30") ?? .now,
        endTime: Date(timeInterval: 1200, since: .dateFromString("2024-01-23 15:30") ?? .now)
    )

    /// Unkown status trip mock model for testing
    ///
    /// - Parameters:
    ///     - driverName: Roman Pearce
    ///     - origin: New York City
    ///     - destination: Sydney
    ///     - status: .finalized
    ///     - startTime: now
    ///     - endTime: now + 20 min
    static let testingUnkownStatusTrip = TripCardModelView(
        driverName: "Jack Sparrow",
        origin: "New York City",
        destination: "Sydney",
        status: .unknown,
        startTime: .dateFromString("2024-01-23 18:30") ?? .now,
        endTime: Date(timeInterval: 1200, since: .dateFromString("2024-01-23 15:30") ?? .now)
    )
}
