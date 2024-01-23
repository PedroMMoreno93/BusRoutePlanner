//
//  TripListTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 23/01/2024.
//

import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector

@testable import BusRoutePlanner

final class TripListTests: XCTestCase {
// TODO: the view has no interaction yet...
}

final class TripListUITests: XCTestCase {
// TODO: the view has no interaction yet...
}

final class TripListSnapsotTests: XCTestCase {
    func test_snapshot() {
        let view = TripListView(viewModel: TestTripListViewModel())
        let viewController = UIHostingController(rootView: view)

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            assertSnapshot(of: viewController, as: .image)
        }
    }
}
