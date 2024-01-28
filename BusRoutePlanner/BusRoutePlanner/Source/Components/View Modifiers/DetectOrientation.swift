//
//  DetectOrientation.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI
/* DetectOrientation */
/// ViewModifier that listens to a device orientation change
/// and updates the binding orientation value.
///
/// - Parameters:
///     - orientation: Binding UIDeviceOrientation value.
struct DetectOrientation: ViewModifier {
    @Binding var orientation: UIDeviceOrientation

    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
    }
}

extension View {
    /* detectOrientation */
    /// View extended function that eases the use of
    /// the DetectOrientation ViewModifier.
    ///
    /// - Parameters:
    ///     - orientation: Binding UIDeviceOrientation value.
    func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DetectOrientation(orientation: orientation))
    }
}
