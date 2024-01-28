//
//  CustomGeometryReader.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 26/01/2024.
//

import SwiftUI

struct GeometryReaderModifier: ViewModifier {
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
    func geometryReader(_ size: Binding<CGSize>) -> some View {
        modifier(GeometryReaderModifier(size: size))
    }
}
