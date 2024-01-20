//
//  MapViewControllerBridge.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 20/01/2024.
//

import GoogleMaps
import SwiftUI
import UIKit

struct MapViewControllerBridge: UIViewControllerRepresentable {

    @Binding var markers: [GMSMarker]
    @Binding var selectedMarker: GMSMarker?
    var onAnimationEnded: () -> Void
    var mapViewWillMove: (Bool) -> Void

    func makeUIViewController(context: Context) -> MapViewController {
        let uiViewController = MapViewController()
        uiViewController.map.delegate = context.coordinator
        return uiViewController
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        markers.forEach { $0.map = uiViewController.map }
        selectedMarker?.map = uiViewController.map
        animateToSelectedMarker(viewController: uiViewController)
    }

    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }

    private func animateToSelectedMarker(viewController: MapViewController) {
        guard let selectedMarker = selectedMarker else {
            return
        }

        let map = viewController.map
        if map.selectedMarker != selectedMarker {
            map.selectedMarker = selectedMarker
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                map.animate(toZoom: kGMSMinZoomLevel)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    map.animate(with: GMSCameraUpdate.setTarget(selectedMarker.position))
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        map.animate(toZoom: 12)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            onAnimationEnded()
                        })
                    })
                }
            }
        }
    }

    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var mapViewControllerBridge: MapViewControllerBridge

        init(_ mapViewControllerBridge: MapViewControllerBridge) {
            self.mapViewControllerBridge = mapViewControllerBridge
        }

        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            self.mapViewControllerBridge.mapViewWillMove(gesture)
        }
    }
}

class MapViewController: UIViewController {

    let map =  GMSMapView(frame: .zero)
    var isAnimating: Bool = false

    override func loadView() {
        super.loadView()
        self.view = map
    }
}

struct GoogleMapsView: UIViewRepresentable {

    private let zoom: Float = 15.0

    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {

    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
    }
}
