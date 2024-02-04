//
//  CustomGeometryReader.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 26/01/2024.
//

import SwiftUI

/* CustomGeometryReader */
/// Custom View modifier that enables the use of
///  Geometry Reader without altering the view's layout.
struct CustomGeometryReader: ViewModifier {
    @Binding var size: CGSize

    func body(content: Content) -> some View {
            content
            .background {
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            self.size = geo.size
                        }
                }
            }
    }
}

extension View {
    /* geometryReader */
    /// View extewnded function that eases the implementation
    ///  of CustomGeometryReader modifier.
    /// - Parameters:
    ///     - size: Binding<CGSize>.
    func geometryReader(_ size: Binding<CGSize>) -> some View {
        modifier(CustomGeometryReader(size: size))
    }
}
