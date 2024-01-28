//
//  HasPointProtocol.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation
import CoreLocation

/* HasPoint */
/// Protocol that defines a point variable and eases the use of certain helpers.
/// For further details see extensions.
protocol HasPoint {
    var point: PointModelView { get }
}

extension HasPoint {
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: point.latitude,
            longitude: point.longitude
        )
    }

    var location: CLLocation {
        return CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
