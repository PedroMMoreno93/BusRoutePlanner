//
//  TripModelViewTest.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import XCTest

@testable import BusRoutePlanner
import CoreLocation
final class TripModelViewTest: XCTestCase {
    let modelServer = TripModelServer(
        driverName: "Alberto Morales",
        status: "ongoing",
        route: "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@",
        startTime: "2018-12-18T08:00:00.000Z",
        origin: AdressModelServer(
            point: PointModelServer(
                latitude: 0,
                longitude: 0
            ),
            address: "Metropolis:lab, Barcelona"
        ),
        description: "Barcelona a Martorell",
        destination: AdressModelServer(
            point: PointModelServer(
                latitude: 0,
                longitude: 0
            ),
            address: "Seat HQ, Martorell"
        ),
        stops: [
            StopModelServer(
                point: PointModelServer(
                    latitude: 41.37653,
                    longitude: 2.17924
                ),
                id: 1
            ),
            StopModelServer(
                point: PointModelServer(
                    latitude: 41.35179,
                    longitude: 2.15494
                ),
                id: 2
            ),
            StopModelServer(
                point: PointModelServer(
                    latitude: 41.43853,
                    longitude: 2.00094
                ),
                id: 3
            ),
            StopModelServer(
                point: PointModelServer(
                    latitude: 41.47711,
                    longitude: 1.91843
                ),
                id: 4
            )
        ],
        endTime: "2018-12-18T09:00:00.000Z"
    )
    // swiftlint:disable function_body_length
    func test_defaultInit() {
        let driverName = "driverName"
        let route = "route"
        let description = "description"
        let status = TripStatus.ongoing

        let origin = AdressModelView(
            point: PointModelView(
                latitude: 0,
                longitude: 0
            ),
            adress: "origin",
            adressType: .origin
        )
        XCTAssertNotNil(origin.coordinates)
        XCTAssertNotNil(origin.location)

        let mockStop1 = StopModelView(point: PointModelView(latitude: 0, longitude: 0), stopId: 1, distanceToOrigin: 10)
        XCTAssertNotNil(mockStop1.id)
        XCTAssertNotNil(mockStop1.marker)

        let mockStop2 = StopModelView(
            from: StopModelServer(
                point: PointModelServer(latitude: 0,longitude: 0),
                id: 2
            ),
            origin: PointModelServer(latitude: 10, longitude: 10)
        )
        XCTAssertNotNil(mockStop2)
        XCTAssertEqual(mockStop2!.stopId, 2)

        XCTAssertFalse(mockStop1 == mockStop2)

        let stops: [StopModelView] = [
            mockStop1
        ]

        let destination = AdressModelView(
            point: PointModelView(
                latitude: 0,
                longitude: 0
            ),
            adress: "destination",
            adressType: .destination
        )

        let startTimeString = "2018-12-18T08:30:00.000Z"
        let endTimeString = "2018-12-18T09:30:00.000Z"

        let model = TripModelView(
            driverName: driverName,
            route: route,
            description: description,
            status: status,
            origin: origin,
            stops: stops,
            destination: destination,
            startTimeString: startTimeString,
            endTimeString: endTimeString,
            inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        )

        XCTAssertEqual(model.driverName, driverName)
        XCTAssertEqual(model.route, route)
        XCTAssertEqual(model.status, status)
        XCTAssertEqual(model.origin, origin)
        XCTAssertTrue(!model.stops.isEmpty)
        XCTAssertEqual(model.destination, destination)

        XCTAssertEqual(model.startTimeString, "09:30")
        XCTAssertEqual(model.endTimeString, "10:30")
        XCTAssertEqual(model.centerLocation.latitude, 0)
        XCTAssertEqual(model.centerMarker.position.latitude, 0)

        let model2 = model
        XCTAssertEqual(model2, model)

        let location = CLLocation(latitude: 0, longitude: 0)
        let distance = model.getDistanceToOrigin(from: location)
        XCTAssertEqual(distance, 0)

        XCTAssertEqual(model.origin.marker.position.latitude, 0)
    }
    // swiftlint:enable function_body_length

    func test_modelServerInit() {
        let model = TripModelView(from: modelServer)

        XCTAssertEqual(model.driverName, modelServer.driverName)
        XCTAssertEqual(model.route, modelServer.route)
        XCTAssertEqual(model.status, TripStatus(rawValue: modelServer.status))
        XCTAssertEqual(model.origin.adress, modelServer.origin.address)
        XCTAssertTrue(!model.stops.isEmpty)
        XCTAssertEqual(model.destination.adress, modelServer.destination.address)

        XCTAssertEqual(model.startTimeString, "09:00")
        XCTAssertEqual(model.endTimeString, "10:00")
        XCTAssertEqual(model.centerLocation.latitude, 0)
        XCTAssertEqual(model.centerMarker.position.latitude, 0)

        let model2 = model
        XCTAssertEqual(model2, model)

        let location = CLLocation(latitude: 0, longitude: 0)
        let distance = model.getDistanceToOrigin(from: location)
        XCTAssertEqual(distance, 0)

        XCTAssertEqual(model.origin.marker.position.latitude, 0)
    }
}
