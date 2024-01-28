//
//  PointModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import CoreLocation

/* PointModelView */
/// Struct that holds the info that defines a point.
/// - Parameters:
///     - latitude: Double.
///     - longitude: Double.
///     - coordinates: CLLocationCoordinate2D (computed).
///     - location: CLLocation (computed).
struct PointModelView {
    let latitude: Double
    let longitude: Double
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var location: CLLocation {
        return CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

extension PointModelView {
    /// Init from model server.
    init(from modelServer: PointModelServer) {
        self.latitude = modelServer.latitude
        self.longitude = modelServer.longitude
    }
}
