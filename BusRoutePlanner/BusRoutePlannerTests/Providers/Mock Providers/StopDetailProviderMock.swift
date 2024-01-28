//
//  StopDetailProviderMock.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

@testable import BusRoutePlanner
struct StopDetailProviderMock: StropDetailProviderProtocol {
    func fetchStopDetail() async throws -> StopDetailModelServer {
        return .mockStopDetailModelServer
    }
}
