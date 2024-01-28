//
//  TripModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 25/01/2024.
//

import Foundation
import CoreLocation
import GoogleMaps

/* TripModelView */
/// Struct that encapsulates a tip's info.
/// - Parameters:
///     - driverName: String.
///     - route: String.
///     - description: String.
///     - status: TripStatus.
///     - origin: AdressModelView.
///     - stops: [StopModelView].
///     - destination: AdressModelView.
///     - startTime: Date?.
///     - endTime: Date?.
///     - dateFormat: String.
///     - datePlaceholder: String.
///     - startTimeString: String (computed).
///     - endTimeString: String (computed).
///     - centerLocation: CLLocationCoordinate2D (computed).
///     - centerMarker: GMSMarker (computed).
struct TripModelView: BaseModelView, Identifiable, Equatable {
    // MARK: Variables
    let id = UUID()
    let driverName: String
    let route: String
    let description: String

    let status: TripStatus

    let origin: AdressModelView
    let stops: [StopModelView]
    let destination: AdressModelView

    let startTime: Date?
    let endTime: Date?

    /// Format: HH:mm
    private let dateFormat: String = "HH:mm"
    /// Default: "-"
    private let datePlaceholder: String = "-"

    // MARK: Computed properties
    var startTimeString: String {
        guard let startTime = startTime else {
            return datePlaceholder
        }

        let stringDate = String.stringFromDate(startTime, format: dateFormat)
        return stringDate
    }

    var endTimeString: String {
        guard let endTime = endTime else {
            return datePlaceholder
        }

        let stringDate = String.stringFromDate(endTime, format: dateFormat)
        return stringDate
    }

    var centerLocation: CLLocationCoordinate2D {
        let origin = origin.coordinates
        let destination = destination.coordinates

        let centerLatitude = (origin.latitude + destination.latitude) / 2
        let centerLongitude = (origin.longitude + destination.longitude) / 2
        let centerLocation = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)

        return centerLocation
    }

    var centerMarker: GMSMarker {
        let marker = GMSMarker(position: centerLocation)
        return marker
    }

    // MARK: functions
    static func == (lhs: TripModelView, rhs: TripModelView) -> Bool {
        return lhs.id == rhs.id
    }

    func getDistanceToOrigin(from location: CLLocation) -> Double {
        return origin.point.location.distance(from: location)
    }

    func isLastStop(_ stop: StopModelView) -> Bool {
        return stop == self.stops.last
    }
}

extension TripModelView {
    /// Default init
    init(
        driverName: String,
        route: String,
        description: String,
        status: TripStatus,
        origin: AdressModelView,
        stops: [StopModelView],
        destination: AdressModelView,
        startTimeString: String,
        endTimeString: String,
        inputDateFormat: String
    ) {
        self.driverName = driverName
        self.route = route
        self.description = description
        self.status = status
        self.origin = origin
        self.stops = stops
        self.destination = destination
        self.startTime = .dateFromString(startTimeString, inputDateFormat)
        self.endTime = .dateFromString(endTimeString, inputDateFormat)
    }
}

extension TripModelView {
    /// Init from model server.
    init(from modelServer: TripModelServer) {
        self.init(
            driverName: modelServer.driverName,
            route: modelServer.route,
            description: modelServer.description,
            status: TripStatus(rawValue: modelServer.status) ?? .unknown,
            origin: AdressModelView(from: modelServer.origin, adressType: .origin),
            stops: modelServer.stops.compactMap({ stopModelServer in
                StopModelView(from: stopModelServer)
            }),
            destination: AdressModelView(from: modelServer.destination, adressType: .destination),
            startTimeString: modelServer.startTime,
            endTimeString: modelServer.endTime,
            inputDateFormat: TripModelServer.dateFormat
        )
    }
}

// MARK: Mocks
extension TripModelView {

    /// Mock trip model for previews
    static let prewviewMock1 = TripModelView(
        driverName: "Alberto Morales",
        route: "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@",
        description: "Barcelona a Martorell",
        status: .ongoing,
        origin: AdressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594),
            adress: "Metropolis:lab, Barcelona",
            adressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.37653,
                    longitude: 2.17924
                ),
                stopId: 1
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.35179,
                    longitude: 2.15494
                ),
                stopId: 2
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.43853,
                    longitude: 2.00094
                ),
                stopId: 3
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.47711,
                    longitude: 1.91843
                ),
                stopId: 4
            )
        ],
        destination: AdressModelView(
            point: PointModelView(
                latitude: 41.49958,
                longitude: 1.90307
            ),
            adress: "Seat HQ, Martorell",
            adressType: .origin
                                    ),
        startTimeString: "2018-12-18T08:00:00.000Z",
        endTimeString: "2018-12-18T09:00:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )

    /// Mock trip model for previews
    static let prewviewMock2 = TripModelView(
        driverName: "Joaquin Sabina",
        route: "sdq{Fc}iLeoBrgBs@xsGecD|sEswEv|Cek@cyA",
        description: "Barcelona a Sant cugat",
        status: .ongoing,
        origin: AdressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            adress: "Metropolis:lab, Barcelona",
            adressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.39869,
                    longitude: 2.1692
                ),
                stopId: 5
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.42522,
                    longitude: 2.09084
                ),
                stopId: 6
            )
        ],
        destination: AdressModelView(
            point: PointModelView(
                latitude: 41.46693,
                longitude: 2.08006
            ),
            adress: "Sant Cugat Centre, El Valles",
            adressType: .origin
        ),
        startTimeString: "2018-12-18T08:00:00.000Z",
        endTimeString: "2018-12-18T08:45:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )

    /// Mock trip model for previews
    static let prewviewMock3 = TripModelView(
        driverName: "Rosalia",
        route: "sdq{Fc}iLurAy{AyiEabDgfDhqEgyB|gA{x@xv@{x@rsF",
        description: "Barcelona a Cerdanyola",
        status: .ongoing,
        origin: AdressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            adress: "Metropolis:lab, Barcelona",
            adressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.42658,
                    longitude: 2.22688
                ),
                stopId: 7
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.38074,
                    longitude: 2.18594
                ),
                stopId: 8
            )
        ],
        destination: AdressModelView(
            point: PointModelView(
                latitude: 41.4914,
                longitude: 2.13349
            ),
            adress: "Cerdanyola Centre, El Valles",
            adressType: .destination
        ),
        startTimeString: "2018-12-18T07:00:00.000Z",
        endTimeString: "2018-12-18T07:50:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )
}
