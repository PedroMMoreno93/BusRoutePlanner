//
//  StylizedSystemImage.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import SwiftUI
/* StylizedSystemImage */
/// View component that eases the implementation of the style
/// applied in the app to the system icons.
/// - Parameters:
///     - systemName: String
///     - font: Font
///     - symbolRenderingMode: SymbolRenderingMode. Default value: .palette.
///     - primaryStyle: PrimaryStyle
///     - secondaryStyle: SecondaryStyle
///     - tertiaryStyle: TertiaryStyle
///
struct StylizedSystemImage<
    PrimaryStyle: ShapeStyle,
    SecondaryStyle: ShapeStyle,
    TertiaryStyle: ShapeStyle
>: View {
    // MARK: Variables
    let systemName: String
    let font: Font
    /// Default set to .palette.
    let symbolRenderingMode: SymbolRenderingMode = .palette
    let primaryStyle: PrimaryStyle
    let secondaryStyle: SecondaryStyle
    let tertiaryStyle: TertiaryStyle

    var body: some View {
        Image(systemName: systemName)
            .systemIconStyle(
                font: font,
                symbolRenderingMode: symbolRenderingMode,
                primaryStyle: primaryStyle,
                secondaryStyle: secondaryStyle,
                tertiaryStyle: tertiaryStyle
            )
    }
}

/* SystemIconStyle */
/// View Modifier component that eases the implementation of the style
/// applied in the app to the system icons.
/// - Parameters:
///     - font: Font
///     - symbolRenderingMode: SymbolRenderingMode. Default value: .palette.
///     - primaryStyle: PrimaryStyle
///     - secondaryStyle: SecondaryStyle
///     - tertiaryStyle: TertiaryStyle
///
struct SystemIconStyle<
    PrimaryStyle: ShapeStyle,
    SecondaryStyle: ShapeStyle,
    TertiaryStyle: ShapeStyle
>: ViewModifier {
    // MARK: Variables
    let font: Font
    var symbolRenderingMode: SymbolRenderingMode = .palette
    let primaryStyle: PrimaryStyle
    let secondaryStyle: SecondaryStyle
    let tertiaryStyle: TertiaryStyle

    func body(content: Content) -> some View {
        content
            .font(font)
            .symbolRenderingMode(.palette)
            .foregroundStyle(primaryStyle, secondaryStyle, tertiaryStyle)
    }
}

extension Image {
    /* systemIconStyle */
    /// Image extended function that eases the implementation of the style
    /// applied in the app to the system icons.
    /// - Parameters:
    ///     - font: Font
    ///     - symbolRenderingMode: SymbolRenderingMode. Default value: .palette.
    ///     - primaryStyle: PrimaryStyle
    ///     - secondaryStyle: SecondaryStyle
    ///     - tertiaryStyle: TertiaryStyle
    /// - Returns: The system icon image with the app style.
    func systemIconStyle<
        PrimaryStyle: ShapeStyle,
        SecondaryStyle: ShapeStyle,
        TertiaryStyle: ShapeStyle
    >(
        font: Font,
        symbolRenderingMode: SymbolRenderingMode = .palette,
        primaryStyle: PrimaryStyle,
        secondaryStyle: SecondaryStyle,
        tertiaryStyle: TertiaryStyle
    ) -> some View {
        modifier(
            SystemIconStyle(
                font: font,
                symbolRenderingMode: symbolRenderingMode,
                primaryStyle: primaryStyle,
                secondaryStyle: secondaryStyle,
                tertiaryStyle: tertiaryStyle
            )
        )
    }
}

#if DEBUG
struct StylizedSystemImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black

            StylizedSystemImage(
                systemName: "person.3.sequence.fill",
                font: .largeTitle,
                primaryStyle: .white,
                secondaryStyle: .blue,
                tertiaryStyle: .yellow
            )
        }
    }
}
#endif
