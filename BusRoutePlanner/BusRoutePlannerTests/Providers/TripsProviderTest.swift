//
//  TripsProviderTest.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import XCTest
@testable import BusRoutePlanner
final class TripsProviderTest: XCTestCase {

    func test_fetchStopDetail() async throws {

        let provider: TripsProviderProtocol = TripsProvider()
        let trips = try await provider.fetchTrips()

        XCTAssertTrue(!trips.isEmpty)
    }
}
