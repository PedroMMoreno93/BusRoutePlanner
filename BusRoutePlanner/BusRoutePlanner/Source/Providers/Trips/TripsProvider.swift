//
//  TripsProviderProtocol.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 25/01/2024.
//
import Foundation

protocol TripsProviderProtocol {
    func fetchTrips() async throws -> [TripModelServer]
}

struct TripsProvider: TripsProviderProtocol {
    /* fetchTrips */
    /// Async function that retrieves an array of trips from the server.
    /// - Returns: [TripModelServer]
    /// - Throws: APIError
    func fetchTrips() async throws -> [TripModelServer] {
#if TEST
        return [.mock1]
#else
        let url = Configuration.API.Provider.tripsUrl
        let method = HTTPMethod.get

        let modelServer: [TripModelServer] = try await APIManager.callAPI(
            url: url,
            method: method,
            responseModel: Array<TripModelServer>.self
        )

        return modelServer
#endif
    }
}
