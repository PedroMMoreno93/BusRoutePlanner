//
//  StopModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import GoogleMaps

/* StopModelView */
/// Struct that holds the info that defines a stop.
/// - Parameters:
///     - point: PointModelView.
///     - stopId: Int?.
///     - marker: GMSMarker (computed).
struct StopModelView: HasPoint, Identifiable, Equatable {
    let id = UUID()
    let point: PointModelView
    let stopId: Int?
    var distanceToOrigin: Double

    var distanceMeasure: Measurement<UnitLength> {
        return Measurement(value: distanceToOrigin, unit: UnitLength.meters)
    }

    var distanceToOriginString: String {
        return  distanceMeasure.formatted(.measurement(width: .abbreviated, usage: .road).locale(.current))
    }

    var marker: GMSMarker {
        let marker = GMSMarker(position: coordinates)
        let icon = UIImage(named: .Images.busStopIcon)!.withRenderingMode(.alwaysOriginal)
        marker.icon = icon
        marker.title = distanceToOriginString

        return marker
    }

    static func == (lhs: StopModelView, rhs: StopModelView) -> Bool {
        return lhs.id == rhs.id
    }
}

extension StopModelView {
    /// Init from model server.
    init?(from modelServer: StopModelServer, origin: PointModelServer) {
        guard let point = modelServer.point else {
            return nil
        }

        let originPointModelView = PointModelView(from: origin)
        let stopPointModelView = PointModelView(from: point)

        let distance = stopPointModelView.getDistanceToPoint(from: originPointModelView)
        self.init(point: PointModelView(from: point), stopId: modelServer.id, distanceToOrigin: distance)
    }
}
