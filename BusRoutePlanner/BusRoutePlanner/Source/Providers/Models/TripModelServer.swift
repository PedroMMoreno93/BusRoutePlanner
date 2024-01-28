//
//  TripModelServer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 25/01/2024.
//

import Foundation

/* TripModelServer */
/// Codable structure that holds the information that defines a trip.
/// - Parameter:
///     - driverName: String
///     - status: String
///     - route: String
///     - startTime: String
///     - origin: AdressModelServer
///     - point: PointModelServer
///     - description: String
///     - stops: [StopModelServer]
///     - endTime: String
struct TripModelServer: Codable {
    let driverName, status, route, startTime: String
    let origin: AdressModelServer
    let description: String
    let destination: AdressModelServer
    let stops: [StopModelServer]
    let endTime: String
}

extension TripModelServer {
    static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
}

extension TripModelServer {
    static let mock1 = TripModelServer(
        driverName: "Alberto Morales",
        status: "ongoing",
        route: "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@",
        startTime: "2018-12-18T08:00:00.000Z",
        origin: AdressModelServer(
            point: PointModelServer(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            address: "Metropolis:lab, Barcelona"
        ),
        description: "Barcelona a Martorell",
        destination: AdressModelServer(
            point: PointModelServer(
                latitude: 41.49958,
                longitude: 1.90307
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
}
