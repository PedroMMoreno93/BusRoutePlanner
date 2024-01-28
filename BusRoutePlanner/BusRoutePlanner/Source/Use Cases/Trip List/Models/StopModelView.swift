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

    var marker: GMSMarker {
        let marker = GMSMarker(position: coordinates)
        let icon = UIImage(named: .Images.busStopIcon)!.withRenderingMode(.alwaysOriginal)
        marker.icon = icon
        marker.title = "Hello World"

        return marker
    }

    static func == (lhs: StopModelView, rhs: StopModelView) -> Bool {
        return lhs.id == rhs.id
    }
}

extension StopModelView {
    /// Init from model server.
    init?(from modelServer: StopModelServer) {
        guard let point = modelServer.point else {
            return nil
        }
        self.init(point: PointModelView(from: point), stopId: modelServer.id)
    }
}
