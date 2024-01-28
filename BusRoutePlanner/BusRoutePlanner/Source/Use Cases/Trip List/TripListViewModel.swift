//
//  TripListViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/// Protocol design for dependencies injection
protocol TripListViewModelProtocol: BaseViewModel {
    var tripsProvider: TripsProviderProtocol { get }
    var model: TripListModelView { get set }
    var selectedTrip: TripModelView? { get set }
    func selectTrip(trip: TripModelView)
    func onAppear() async
    func handleSucess(context: String?)
    func handleError(_ error: Error)
}

extension TripListViewModelProtocol {
    var availableTrips: [TripModelView] {
        self.model.trips
    }

    var areAvailableTrips: Bool {
        return !availableTrips.isEmpty
    }

    func selectTrip(trip: TripModelView) {
        self.selectedTrip = selectedTrip
    }

    func isTripSelected(_ trip: TripModelView) -> Bool {
         guard let selectedTrip = selectedTrip else {
             return false
         }

         return selectedTrip == trip
     }

     func getIndexForTrip(_ trip: TripModelView) -> Int {
         let index = availableTrips.firstIndex { availableTrip in
             trip == availableTrip
         }

         return index ?? 0
     }
}

/// Class that encapsulates all the info that TripListView required,
/// besides handling the interaction flow.
class TripListViewModel: TripListViewModelProtocol {

    // MARK: Variables
    @Published var model: TripListModelView
    @Published var selectedTrip: TripModelView?
    @Published var isSheetPresented: Bool = false
    @Published var status: ViewModelStatus = .empty
    @Published var showAlert: Bool = false

    // MARK: Providers
    let tripsProvider: TripsProviderProtocol

    init(
        model: TripListModelView = .empty,
        tripsProvider: TripsProviderProtocol = TripsProvider()
    ) {
        self.model = model
        self.tripsProvider = tripsProvider
    }

    // MARK: Functions
    @MainActor
    func onAppear() async {
        do {
            status = .loading
            let trips = try await self.fetchTrips()
            self.model.trips = trips
        } catch let error {
            self.handleError(error)
        }
    }

    func handleSucess(context: String? = nil) {
        Logger.log("✅ SUCCESS \(String(describing: context))")
        self.status = .success
    }

    func handleError(_ error: Error) {
        Logger.log("❌ ERROR: \(error.localizedDescription)")
        self.status = .error
        self.showAlert = true
    }

    // MARK: Private functions
    private func fetchTrips() async throws -> [TripModelView] {
            let tripsModelServer = try await tripsProvider.fetchTrips()
            let tripsModelView = tripsModelServer.compactMap({ modelServer in
                TripModelView(from: modelServer)
            })
            return tripsModelView
    }
}
