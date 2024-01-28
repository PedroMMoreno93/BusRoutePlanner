//
//  TripListProviderMock.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

@testable import BusRoutePlanner
struct TripListProviderMock: TripsProviderProtocol {
    func fetchTrips() async throws -> [TripModelServer] {
        return [.mock1]
    }
}

struct TripListFailingProviderMock: TripsProviderProtocol {
    func fetchTrips() async throws -> [TripModelServer] {
        throw APIError.badResponse
    }
}
