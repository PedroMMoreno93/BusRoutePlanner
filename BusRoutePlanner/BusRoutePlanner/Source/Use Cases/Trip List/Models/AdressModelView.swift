//
//  AdressModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import GoogleMaps

/* AdressModelView */
/// Struct that holds the info that defines an adress.
/// - Parameters:
///     - point: PointModelView.
///     - adress: String.
///     - adressType: AdressType.
///     - marker: GMSMarker (computed).
struct AdressModelView: HasPoint, Identifiable, Equatable {
    let id = UUID()
    let point: PointModelView
    let adress: String
    let adressType: AdressType

    var marker: GMSMarker {
        let marker = GMSMarker(position: coordinates)
        marker.icon = adressType.icon

        return marker
    }

    static func == (lhs: AdressModelView, rhs: AdressModelView) -> Bool {
        return lhs.id == rhs.id
    }
}

extension AdressModelView {
    /* AdressType */
    /// Enum type that holds the adress type.
    /// It also provides the equivalent icon.
    /// - origin
    /// - destination
    enum AdressType {
        case origin
        case destination

        var icon: UIImage {
            switch self {
            case .origin:
                UIImage(named: .Images.busIcon)!.withRenderingMode(.alwaysOriginal)
            case .destination:
                UIImage(named: .Images.finishIcon)!.withRenderingMode(.alwaysOriginal)
            }
        }
    }
}

extension AdressModelView {
    /// Init from model server.
    init(
        from modelServer: AdressModelServer,
        adressType: AdressType
    ) {
        self.init(point: PointModelView(from: modelServer.point), adress: modelServer.address, adressType: adressType)
    }
}
