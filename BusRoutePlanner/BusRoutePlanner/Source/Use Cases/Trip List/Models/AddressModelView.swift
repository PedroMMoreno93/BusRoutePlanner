//
//  AddressModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import GoogleMaps

/* AddressModelView */
/// Struct that holds the info that defines an address.
/// - Parameters:
///     - point: PointModelView.
///     - address: String.
///     - addressType: AddressType.
///     - marker: GMSMarker (computed).
struct AddressModelView: HasPoint, Identifiable, Equatable {
    let id = UUID()
    let point: PointModelView
    let address: String
    let addressType: AddressType

    var marker: GMSMarker {
        let marker = GMSMarker(position: coordinates)
        marker.icon = addressType.icon

        marker.title = address
        return marker
    }

    static func == (lhs: AddressModelView, rhs: AddressModelView) -> Bool {
        return lhs.id == rhs.id
    }
}

extension AddressModelView {
    /* AddressType */
    /// Enum type that holds the address type.
    /// It also provides the equivalent icon.
    /// - origin
    /// - destination
    enum AddressType {
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

extension AddressModelView {
    /// Init from model server.
    init(
        from modelServer: AddressModelServer,
        addressType: AddressType
    ) {
        self.init(
            point: PointModelView(from: modelServer.point),
            address: modelServer.address,
            addressType: addressType
        )
    }
}
