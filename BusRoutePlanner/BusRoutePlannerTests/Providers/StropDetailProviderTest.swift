//
//  StropDetailProviderTest.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import XCTest
@testable import BusRoutePlanner
final class StropDetailProviderTest: XCTestCase {

    func test_fetchStopDetail() async throws {

        let provider: StropDetailProviderProtocol = StropDetailProvider()
        let stop = try await provider.fetchStopDetail()

        XCTAssertEqual(stop.tripID, StopDetailModelServer.mockStopDetailModelServer.tripID)
    }
}
