//
//  TestTripCard.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector
@testable import BusRoutePlanner

final class TestTripCard: XCTestCase {
    func test_snapshot() {
        let view = TripCardView(model: .testingOngoingTrip, isSelected: false, action: {})
        let viewController = UIHostingController(rootView: view)

        assertSnapshot(of: viewController, as: .image)
    }

    func test_initModel() {
        let driverName = "driverName"
        let origin = "origin"
        let destination = "destination"
        let status = TripStatus.ongoing

        let model = TripCardModelView(
            driverName: driverName,
            origin: origin,
            destination: destination,
            status: status,
            startTime: nil,
            endTime: nil
        )

        let placeholder = "-"

        XCTAssertEqual(model.driverName, driverName)
        XCTAssertEqual(model.origin, origin)
        XCTAssertEqual(model.destination, destination)
        XCTAssertEqual(model.status, status)
        XCTAssertNil(model.startTime)
        XCTAssertNil(model.endTime)
        XCTAssertEqual(model.startTimeString, placeholder)
        XCTAssertEqual(model.endTimeString, placeholder)
    }
}
