//
//  GlassBackground.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI

/* TransparentBackground */
/// ViewModifier that defines the style
///  for a view embeded in a has glass-style background
/// - Parameters:
///     - cornerRadius: CGFloat.
///     - shadowRadius: CGFloat.
///     - isSelected: Bool.
struct GlassBackground: ViewModifier {
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
    /* withTransparentBackground */
    /// View extewnded function that eases the implementation of GlassBackground modifier.
    /// - Parameters:
    ///     - cornerRadius: CGFloat.
    ///     - shadowRadius: CGFloat.
    ///     - isSelected: Bool.
    func withTransparentBackground(
        cornerRadius: CGFloat,
        shadowRadius: CGFloat,
        isSelected: Bool
    ) -> some View {
        modifier(GlassBackground(
            cornerRadius: cornerRadius,
            shadowRadius: shadowRadius,
            isSelected: isSelected
        ))
    }
}

#if DEBUG
struct GlassBackground_Previews: PreviewProvider {
    static var previews: some View {
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
}
#endif
