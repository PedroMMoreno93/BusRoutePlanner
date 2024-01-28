//
//  StropDetailProvider.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation

protocol StropDetailProviderProtocol {
    func fetchStopDetail() async throws -> StopDetailModelServer
}

/*
 MARK: this provider has been developed but not implemented.
 This decission has been made due to the fact that the service returns just a
 single stop an doesn't provide any additional value to the app.
 The stop info showed will be obtain from the trips service
 */
struct StropDetailProvider: StropDetailProviderProtocol {
    func fetchStopDetail() async throws -> StopDetailModelServer {
#if TEST
        return .mockStopDetailModelServer
#else
        let url = Configuration.API.Provider.stopsUrl
        let method = HTTPMethod.get

        let modelServer: StopDetailModelServer = try await APIManager.callAPI(
            url: url,
            method: method,
            responseModel: StopDetailModelServer.self
        )

        return modelServer
#endif
    }
}
