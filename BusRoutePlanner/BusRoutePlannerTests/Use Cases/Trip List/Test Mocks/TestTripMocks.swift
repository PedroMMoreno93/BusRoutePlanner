//
//  TestTripMocks.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//
@testable import BusRoutePlanner

extension TripModelView {
    /// Ongoing trip mock model for testing.
    static let testOngoingTripModel = TripModelView(
        driverName: "Alberto Morales",
        route: "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@",
        description: "Barcelona a Martorell",
        status: .ongoing,
        origin: AddressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594),
            address: "Metropolis:lab, Barcelona",
            addressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.37653,
                    longitude: 2.17924
                ),
                stopId: 1,
                distanceToOrigin: 10
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.35179,
                    longitude: 2.15494
                ),
                stopId: 2,
                distanceToOrigin: 20
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.43853,
                    longitude: 2.00094
                ),
                stopId: 3,
                distanceToOrigin: 30
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.47711,
                    longitude: 1.91843
                ),
                stopId: 4,
                distanceToOrigin: 40
            )
        ],
        destination: AddressModelView(
            point: PointModelView(
                latitude: 41.49958,
                longitude: 1.90307
            ),
            address: "Seat HQ, Martorell",
            addressType: .origin
                                    ),
        startTimeString: "2018-12-18T08:00:00.000Z",
        endTimeString: "2018-12-18T09:00:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )

    /// Scheuduled trip mock model for testing.
    static let testScheuduledTripModel = TripModelView(
        driverName: "Joaquin Sabina",
        route: "sdq{Fc}iLeoBrgBs@xsGecD|sEswEv|Cek@cyA",
        description: "Barcelona a Sant cugat",
        status: .scheduled,
        origin: AddressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            address: "Metropolis:lab, Barcelona",
            addressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.39869,
                    longitude: 2.1692
                ),
                stopId: 5,
                distanceToOrigin: 10
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.42522,
                    longitude: 2.09084
                ),
                stopId: 6,
                distanceToOrigin: 20
            )
        ],
        destination: AddressModelView(
            point: PointModelView(
                latitude: 41.46693,
                longitude: 2.08006
            ),
            address: "Sant Cugat Centre, El Valles",
            addressType: .origin
        ),
        startTimeString: "2018-12-18T08:00:00.000Z",
        endTimeString: "2018-12-18T08:45:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )

    /// Finalized trip mock model for testing.
    static let testFinalizedTripModel = TripModelView(
        driverName: "Rosalia",
        route: "sdq{Fc}iLurAy{AyiEabDgfDhqEgyB|gA{x@xv@{x@rsF",
        description: "Barcelona a Cerdanyola",
        status: .finalized,
        origin: AddressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            address: "Metropolis:lab, Barcelona",
            addressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.42658,
                    longitude: 2.22688
                ),
                stopId: 7,
                distanceToOrigin: 10
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.38074,
                    longitude: 2.18594
                ),
                stopId: 8,
                distanceToOrigin: 20
            )
        ],
        destination: AddressModelView(
            point: PointModelView(
                latitude: 41.4914,
                longitude: 2.13349
            ),
            address: "Cerdanyola Centre, El Valles",
            addressType: .destination
        ),
        startTimeString: "2018-12-18T07:00:00.000Z",
        endTimeString: "2018-12-18T07:50:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )

    /// Cancelled trip mock model for testing.
    static let testCancelledTripModel = TripModelView(
        driverName: "Joaquin Sabina",
        route: "sdq{Fc}iLeoBrgBs@xsGecD|sEswEv|Cek@cyA",
        description: "Barcelona a Sant cugat",
        status: .cancelled,
        origin: AddressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            address: "Metropolis:lab, Barcelona",
            addressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.39869,
                    longitude: 2.1692
                ),
                stopId: 5,
                distanceToOrigin: 10
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.42522,
                    longitude: 2.09084
                ),
                stopId: 6,
                distanceToOrigin: 20
            )
        ],
        destination: AddressModelView(
            point: PointModelView(
                latitude: 41.46693,
                longitude: 2.08006
            ),
            address: "Sant Cugat Centre, El Valles",
            addressType: .origin
        ),
        startTimeString: "2018-12-18T08:00:00.000Z",
        endTimeString: "2018-12-18T08:45:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )

    /// Unknown trip mock model for testing.
    static let testUnknownStatusTripModel = TripModelView(
        driverName: "Rosalia",
        route: "sdq{Fc}iLurAy{AyiEabDgfDhqEgyB|gA{x@xv@{x@rsF",
        description: "Barcelona a Cerdanyola",
        status: .unknown,
        origin: AddressModelView(
            point: PointModelView(
                latitude: 41.38074,
                longitude: 2.18594
            ),
            address: "Metropolis:lab, Barcelona",
            addressType: .origin
        ),
        stops: [
            StopModelView(
                point: PointModelView(
                    latitude: 41.42658,
                    longitude: 2.22688
                ),
                stopId: 7,
                distanceToOrigin: 10
            ),
            StopModelView(
                point: PointModelView(
                    latitude: 41.38074,
                    longitude: 2.18594
                ),
                stopId: 8,
                distanceToOrigin: 20
            )
        ],
        destination: AddressModelView(
            point: PointModelView(
                latitude: 41.4914,
                longitude: 2.13349
            ),
            address: "Cerdanyola Centre, El Valles",
            addressType: .destination
        ),
        startTimeString: "2018-12-18T07:00:00.000Z",
        endTimeString: "2018-12-18T07:50:00.000Z",
        inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    )
}
