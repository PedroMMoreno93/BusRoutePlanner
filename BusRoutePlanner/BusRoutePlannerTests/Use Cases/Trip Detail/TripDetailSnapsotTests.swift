//
//  TripDetailSnapsotTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector

@testable import BusRoutePlanner

final class TripDetailSnapsotTests: XCTestCase {

    func test_snapshot() {
        let view = TripDetailView(model: .testCancelledTripModel, isLandsCape: false) {
        }

        let viewController = UIHostingController(rootView: view)

        assertSnapshot(of: viewController, as: .image)
    }
}
