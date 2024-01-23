//
//  GoogleMapsView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import GoogleMaps
import SwiftUI
import UIKit

struct GoogleMapsView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> GoogleMapsViewController {
        let viewController = GoogleMapsViewController()
        viewController.map.delegate = context.coordinator
        return viewController
    }

    func updateUIViewController(_ uiViewController: GoogleMapsViewController, context: Context) {
    }

    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }

    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var mapViewControllerBridge: GoogleMapsView

        init(_ mapViewControllerBridge: GoogleMapsView) {
            self.mapViewControllerBridge = mapViewControllerBridge
        }

        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        }
    }
}

class GoogleMapsViewController: UIViewController {

    let map = GMSMapView()

    var isAnimating: Bool = false

    override func loadView() {
        super.loadView()
        self.view = map
    }
}

#if DEBUG
struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
            .ignoresSafeArea()
    }
}
#endif
