//
//  TripListViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

protocol TripListViewModelProtocol: BaseViewModel {
    var model: TripListModelView { get set }
    var selectedTrip: TripCardModelView? { get set }
}

extension TripListViewModelProtocol {
    var availableTrips: [TripCardModelView] {
        self.model.trips
    }

    var areAvailableTrips: Bool {
        return !availableTrips.isEmpty
    }
}

class TripListViewModel: TripListViewModelProtocol {

    // MARK: Variables
    @Published var model: TripListModelView
    @Published var selectedTrip: TripCardModelView?

    init(model: TripListModelView = .previewTripList) {
        self.model = model
    }
}

class TestTripListViewModel: TripListViewModelProtocol {
    typealias ModelView = TripListModelView

    // MARK: Variables
    @Published var model: TripListModelView
    @Published var selectedTrip: TripCardModelView?

    init(model: TripListModelView = .previewTripList) {
        self.model = model
    }
}
