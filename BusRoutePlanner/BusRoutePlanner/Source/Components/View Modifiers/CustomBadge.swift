//
//  CustomBadge.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 03/02/2024.
//

import SwiftUI

/* CustomBadge */
/// Custom View Modifier that displays a badge with the count
/// in the top right corner of a view.
/// - Parameter:
///     - count: Int
///     - foregroundColor: Color. Set to white by default
///     - backgroundColor: Color. Set to red by default
struct CustomBadge: ViewModifier {
    // MARK: Variables
    var count: Int
    /// Default set to .white
    var foregroundColor: Color = .white
    /// Default set to .red.
    var backgroundColor: Color = .red

    @State private var size: CGSize = .zero

    // MARK: Constants
    // Value of 0.4
    private let horizontalOffsetFactor: CGFloat = 0.4
    // Value of 0.4
    private let verticalOffsetFactor: CGFloat = 0.4
    // Value of 6
    private let capsuleHorizontalPadding: CGFloat = 6
    // Value of 2
    private let capsuleVerticalPadding: CGFloat = 2

    func body(content: Content) -> some View {
        content
            .geometryReader($size)
            .overlay {
                capsule
                    .offset(
                        x: size.width * horizontalOffsetFactor
                        ,
                        y: -size.height * verticalOffsetFactor
                    )
            }
    }

    var capsule: some View {
        Text("\(count)")
            .font(.caption)
            .foregroundStyle(foregroundColor)
            .padding(.horizontal, capsuleHorizontalPadding)
            .padding(.vertical, capsuleVerticalPadding)
            .background {
               Capsule()
                    .fill(backgroundColor)
            }
    }
}

extension View {
    /// Extended View function that eases the implementation of
    /// the CustomBadge modifier.
    func customBadge(_ count: Int) -> some View {
        modifier(CustomBadge(count: count))
    }
}

#if DEBUG
struct CustomBadge_Previews: PreviewProvider {
    static var previews: some View {
        StylizedSystemImage(
            systemName: "folder.fill",
            font: .title3,
            primaryStyle: .primaryText.opacity(0.6),
            secondaryStyle: .primaryText.opacity(0.6),
            tertiaryStyle: .primaryText.opacity(0.6)
        )
        .padding()
        .glassBackground(
            cornerRadius: 10,
            shadowRadius: 10,
            isSelected: false
        )
        .customBadge(10)
    }
}
#endif
