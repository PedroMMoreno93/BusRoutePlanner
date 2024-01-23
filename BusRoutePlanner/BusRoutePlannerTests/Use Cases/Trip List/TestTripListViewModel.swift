//
//  TestTripListViewModel.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 23/01/2024.
//

import SwiftUI
@testable import BusRoutePlanner

class TestTripListViewModel: TripListViewModelProtocol {
    typealias ModelView = TripListModelView

    // MARK: Variables
    @Published var model: TripListModelView
    @Published var selectedTrip: TripCardModelView?

    init(model: TripListModelView = .test) {
        self.model = model
    }

    func selectTrip(trip: TripCardModelView) {
        self.selectedTrip = selectedTrip
    }
}

extension TripListModelView {
    static let test = TripListModelView(trips: [
        .testingOngoingTrip,
        .testingCancelledTrip,
        .testingFinalizedTrip,
        .testingShceduledTrip
    ])
}

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
        startTime: .dateFromString("2024-01-23 18:30:00") ?? .now,
        endTime: Date(timeInterval: 1200, since: .now)
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
        startTime: .dateFromString("2024-01-23 18:30:00") ?? .now,
        endTime: Date(timeInterval: 1200, since: .now)
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
        startTime: .dateFromString("2024-01-23 18:30:00") ?? .now,
        endTime: Date(timeInterval: 1200, since: .now)
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
        startTime: .dateFromString("2024-01-23 18:30:00") ?? .now,
        endTime: Date(timeInterval: 1200, since: .now)
    )
}
extension Date {
    /* dateFromString */
    /// Returns date from a string date with a specific format.
    ///
    /// - Parameters:
    ///     - date: String
    ///     - format: String. Default yyyy-MM-dd HH:mm:ss, ex: "2023-05-19 10:30:00"
    /// - Returns: Date
    static func dateFromString(_ date: String, _ format: String = "yyyy-MM-dd HH:mm:ss") -> Date? { // TODO: FALLA

        // Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current

        // Set Date Format
        dateFormatter.dateFormat = format

        // Convert String to Date
        return dateFormatter.date(from: date)
    }
}
