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

final class TripListViewModelTests: XCTestCase {
    var viewModel: (any TripListViewModelProtocol)?

    func test_init() {
        let model: TripListModelView = .testModel
        self.viewModel = TripListViewModel(model: model)

        XCTAssertEqual(model.trips.first, viewModel!.model.trips.first)

        self.viewModel = TestTripListViewModel(model: model)

        XCTAssertEqual(model.trips.first, viewModel!.model.trips.first)
    }

    func test_fetchTrips() async throws {
        self.viewModel = TripListViewModel(
            model: .empty,
            tripsProvider: TripListProviderMock()
        )

        await self.viewModel!.onAppear()

        XCTAssertTrue(!viewModel!.model.trips.isEmpty)

        self.viewModel = TestTripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListProviderMock()
        )

        await self.viewModel!.onAppear()

        XCTAssertTrue(!viewModel!.model.trips.isEmpty)

    }

    func test_failingFetchTrips() async {
        self.viewModel = TripListViewModel(
            model: .empty,
            tripsProvider: TripListFailingProviderMock()
        )

        await self.viewModel!.onAppear()

        XCTAssertTrue(self.viewModel!.model.trips.isEmpty)

        self.viewModel = TestTripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListFailingProviderMock()
        )

        await self.viewModel!.onAppear()

        XCTAssertTrue(self.viewModel!.model.trips.isEmpty)
    }

    func test_handleError() {
        self.viewModel = TripListViewModel(
            model: .empty,
            tripsProvider: TripListFailingProviderMock()
        )
        self.viewModel!.handleError(APIError.badResponse)

        XCTAssertEqual(self.viewModel!.status, .error)

        self.viewModel = TestTripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListFailingProviderMock()
        )
        self.viewModel!.handleError(APIError.badResponse)

        XCTAssertEqual(self.viewModel!.status, .error)
    }

    func test_handleSuccess() {
        self.viewModel = TripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListFailingProviderMock()
        )
        self.viewModel!.handleSucess(context: nil)
        XCTAssertEqual(self.viewModel!.status, .success)

        self.viewModel = TestTripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListFailingProviderMock()
        )
        self.viewModel!.handleSucess(context: nil)
        XCTAssertEqual(self.viewModel!.status, .success)
    }

    func test_selectTrip() {
        let model = TripModelView.testCancelledTripModel

        self.viewModel = TripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListFailingProviderMock()
        )

        self.viewModel!.selectTrip(trip: model)
        self.viewModel!.selectedTrip = model

        XCTAssertNotNil(self.viewModel!.selectedTrip)

        self.viewModel = TestTripListViewModel(
            model: TripListModelView.empty,
            tripsProvider: TripListFailingProviderMock()
        )

        self.viewModel!.selectTrip(trip: model)
        self.viewModel!.selectedTrip = model

        XCTAssertNotNil(self.viewModel!.selectedTrip)
    }
}

final class TripListSnapsotTests: XCTestCase {
    func test_snapshot() {
        let view = TripListView(viewModel: TripListViewModel(model: .testModel))
        let viewController = UIHostingController(rootView: view)

        assertSnapshot(of: viewController, as: .image)
    }
}
