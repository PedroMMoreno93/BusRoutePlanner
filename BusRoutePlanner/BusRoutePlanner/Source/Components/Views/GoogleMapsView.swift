//
//  GoogleMapsView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import GoogleMaps
import SwiftUI
import UIKit

/* GoogleMapsView */
/// Struct that represents a Google Maps view providing a SwiftUI view.
///
/// - Parameters:
///    - selectedTrip: TripModelView?
///     - animatedTransition: Bool. Default value set to true.
///     Indicates whether animate the transition when the a new trip is selected.
///     - onAnimationEnded: () -> Void. Calls back when the transition is finished.
///     - mapViewWillMove: (Bool) -> Void. Calls back indicating if the map has mooved.
///     - defaultPolylineStrokeWidth: defaultPolylineStrokeWidth [private]. Default value set to 4.
struct GoogleMapsView: UIViewControllerRepresentable {
    var selectedTrip: TripModelView?
    var animatedTransition: Bool = true
    var onAnimationEnded: () -> Void
    var mapViewWillMove: (Bool) -> Void
    private static let defaultPolylineStrokeWidth: CGFloat = 4

    func makeUIViewController(context: Context) -> GoogleMapsViewController {
        let uiViewController = GoogleMapsViewController()
        uiViewController.map.delegate = context.coordinator

        return uiViewController
    }

    func updateUIViewController(
        _ uiViewController: GoogleMapsViewController,
        context: Context
    ) {
        setNewMarker(viewController: uiViewController)
    }

    /// Bridge connection
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }

    /* setNewMarker */
    /// When a new selection is performed, the map will zoom out and then zoom in to the new selected marker.
    ///
    /// - Parameter viewController: param descriptionGoogleMapsViewController.
    private func setNewMarker(viewController: GoogleMapsViewController) {
        guard let selectedTrip = selectedTrip else {
            return
        }

        let map = viewController.map
        guard map.selectedMarker != selectedTrip.origin.marker else {
            return
        }

        map.clear()
        map.selectedMarker = selectedTrip.origin.marker

        if animatedTransition {
            setMarkersWithAnimatedZoom(map: map, selectedTrip: selectedTrip)
        } else {
            setMarkers(map: map, selectedTrip: selectedTrip)
        }
        onAnimationEnded()
    }

    /* setMarkersWithAnimatedZoom */
    /// When a new selection is performed, the map will zoom out and then zoom in to the new selected marker.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the marker will be showed.
    ///     - selectedTrip: TripModelView. New trip.
    private func setMarkersWithAnimatedZoom(
        map: GMSMapView,
        selectedTrip: TripModelView
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            map.animate(toZoom: kGMSMinZoomLevel)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                map.animate(with: GMSCameraUpdate.setTarget(selectedTrip.origin.marker.position))

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    map.animate(toZoom: 12)

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        setMarkers(map: map, selectedTrip: selectedTrip)

                        onAnimationEnded()
                    })
                })
            }
        }
    }

    /* setMarkers */
    /// Sets markers for the origin, destination, stops for a map, and the route of the selected trip.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the markers will be showed.
    ///     - selectedTrip: TripModelView. New trip.
    private func setMarkers(
        map: GMSMapView,
        selectedTrip: TripModelView
    ) {
        map.clear()
        map.selectedMarker = selectedTrip.origin.marker

        setOriginAndDestination(in: map, selectedTrip)
        setStops(in: map, selectedTrip)
        drawPolyline(
            in: map,
            from: selectedTrip.route,
            color: UIColor(selectedTrip.status.color)
        )
    }

    /* setOriginAndDestination */
    /// Sets markers for the origin and destination of the selected trip.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the markers will be showed.
    ///     - selectedTrip: TripModelView. New trip.
    private func setOriginAndDestination(
        in map: GMSMapView,
        _ selectedTrip: TripModelView
    ) {
        selectedTrip.destination.marker.map = map
        selectedTrip.origin.marker.map = map
    }

    /* setStops */
    /// Sets markers for the stops for a map of the selected trip.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the markers will be showed.
    ///     - selectedTrip: TripModelView. New trip.
    private func setStops(
        in map: GMSMapView,
        _ selectedTrip: TripModelView
    ) {
        selectedTrip.stops.forEach { stop in
            stop.marker.map = map
        }
    }

    /* drawPolyline */
    /// Draw a polline on the map representing the selected trips's route.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the polyline will be showed.
    ///     - origin: CLLocationCoordinate2D.
    ///     - destination: CLLocationCoordinate2D.
    ///     - color: UIColor. Set by default to blue.
    ///     - strokeWidth: CGFloat. Takes its default valuenfrom GoogleMapsView.defaultPolylineStrokeWidth.
    private  func drawPolyline(
        in map: GMSMapView,
        origin: CLLocationCoordinate2D,
        destination: CLLocationCoordinate2D,
        color: UIColor = .blue,
        strokeWidth: CGFloat = GoogleMapsView.defaultPolylineStrokeWidth
    ) {
        let path = GMSMutablePath()
        path.add(origin)
        path.add(destination)

        drawPolyline(
            in: map,
            from: path,
            color: color,
            strokeWidth: strokeWidth
        )
    }

    /* drawPolyline */
    /// Draw a polline on the map representing the selected trips's route.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the polyline will be showed.
    ///     - encodedPath: String. Encoded route path.
    ///     - color: UIColor. Set by default to blue.
    ///     - strokeWidth: CGFloat. Takes its default valuenfrom GoogleMapsView.defaultPolylineStrokeWidth.
    private func drawPolyline(
        in map: GMSMapView,
        from encodedPath: String,
        color: UIColor = .blue,
        strokeWidth: CGFloat = GoogleMapsView.defaultPolylineStrokeWidth
    ) {
        guard let path = GMSMutablePath(fromEncodedPath: encodedPath) else {
            return
        }

        drawPolyline(
            in: map,
            from: path,
            color: color,
            strokeWidth: strokeWidth
        )
    }

    /* drawPolyline */
    /// Draw a polline on the map representing the selected trips's route.
    /// - Parameters:
    ///     - map: GMSMapView. Map view where the polyline will be showed.
    ///     - path: GMSMutablePath.
    ///     - color: UIColor. Set by default to blue.
    ///     - strokeWidth: CGFloat. Takes its default valuenfrom GoogleMapsView.defaultPolylineStrokeWidth.
    private func drawPolyline(
        in map: GMSMapView,
        from path: GMSMutablePath,
        color: UIColor = .blue,
        strokeWidth: CGFloat = GoogleMapsView.defaultPolylineStrokeWidth
    ) {
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = strokeWidth
        polyline.strokeColor = color

        polyline.map = map
    }

    /* MapViewCoordinator */
    /// Bridge to control the view's delegates.
    /// - Parameter mapViewControllerBridge: GoogleMapsView
    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var mapViewControllerBridge: GoogleMapsView

        init(_ mapViewControllerBridge: GoogleMapsView) {
            self.mapViewControllerBridge = mapViewControllerBridge
        }

        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            self.mapViewControllerBridge.mapViewWillMove(gesture)
        }
    }
}

/* GoogleMapsViewController */
/// ViewControler to hold the UIKit map view.
class GoogleMapsViewController: UIViewController {
    var map = GMSMapView()
    var isAnimating: Bool = false

    override func loadView() {
        super.loadView()
        self.view = map
    }
}

#if DEBUG
struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView(selectedTrip: .prewviewMock1, onAnimationEnded: { }, mapViewWillMove: {_ in})
            .ignoresSafeArea()
    }
}
#endif
