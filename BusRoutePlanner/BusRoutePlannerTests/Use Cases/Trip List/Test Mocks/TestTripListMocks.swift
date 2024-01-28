//
//  TestTripListMocks.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//
@testable import BusRoutePlanner

extension TripListModelView {
    /// Model that contains several test trip models, one per trip status case.
    static let testModel = TripListModelView(trips: [
        TripModelView.testOngoingTripModel,
        TripModelView.testCancelledTripModel,
        TripModelView.testFinalizedTripModel,
        TripModelView.testScheuduledTripModel,
        TripModelView.testUnknownStatusTripModel
    ])
}
