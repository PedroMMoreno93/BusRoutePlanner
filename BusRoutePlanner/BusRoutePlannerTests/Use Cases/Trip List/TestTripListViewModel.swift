//
//  TestTripListViewModel.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 23/01/2024.
//
import SwiftUI

@testable import BusRoutePlanner

class TestTripListViewModel: BusRoutePlanner.TripListViewModelProtocol {
    // MARK: Variables
    @Published var model: BusRoutePlanner.TripListModelView
    @Published var selectedTrip: BusRoutePlanner.TripModelView?
    @Published var status: BusRoutePlanner.ViewModelStatus = .empty
    @Published var showAlert: Bool = false
    @Published  var isSheetPresented: Bool = false

    // MARK: Providers
    let tripsProvider: BusRoutePlanner.TripsProviderProtocol

    init(
        model: BusRoutePlanner.TripListModelView = .testModel,
        tripsProvider: TripsProviderProtocol = TripsProvider()
    ) {
        self.model = model
        self.tripsProvider = tripsProvider
    }

    @MainActor
    func onAppear() async {
        do {
            let tripsModelServer = try await tripsProvider.fetchTrips()
            let tripsModelView = tripsModelServer.compactMap { tripModelServer in
                return BusRoutePlanner.TripModelView(from: tripModelServer)
            }
            self.model.trips = tripsModelView
            self.handleSucess(context: nil)
        } catch let error {
            handleError(error)
        }
    }

    func handleError(_ error: Error) {
        self.status = .error
    }
    func handleSucess(context: String?) {
        self.status = .success
    }

    func selectTrip(trip: BusRoutePlanner.TripModelView) {
        self.selectedTrip = selectedTrip
    }
}
