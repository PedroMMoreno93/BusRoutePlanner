//
//  TransparentBackground.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI

struct TransparentBackground: ViewModifier {
    var cornerRadius: CGFloat
    var shadowRadius: CGFloat
    var isSelected: Bool

    func body(content: Content) -> some View {
        content
            .background(
                isSelected ? .regularMaterial : .ultraThinMaterial
            )
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            .shadow(
                radius: shadowRadius
            )
    }
}

extension View {
    func withTransparentBackground(
        cornerRadius: CGFloat,
        shadowRadius: CGFloat,
        isSelected: Bool
    ) -> some View {
        modifier(TransparentBackground(
            cornerRadius: cornerRadius,
            shadowRadius: shadowRadius,
            isSelected: isSelected
        ))
    }
}

#Preview {
    ZStack {
        Color.teal

        Image(systemName: "heart.fill")
            .padding()
            .withTransparentBackground(
                cornerRadius: 20,
                shadowRadius: 5,
                isSelected: true
        )
    }
}
