//
//  TextStyle.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

struct TextStyle: ViewModifier {
    var font: Font
    var fontWeight: Font.Weight?
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(font)
            .fontWeight(fontWeight)
            .foregroundStyle(color)
    }
}

extension Text {
    func textStyle(
        font: Font = .body,
        fontWeight: Font.Weight? = .regular,
        color: Color = .primaryText
    ) -> some View {
        modifier(TextStyle(
            font: font,
            fontWeight: fontWeight,
            color: color
        ))
    }
}

#if DEBUG
struct TextStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Default style")
                .textStyle()

            Text("Bold Caption")
                .textStyle(font: .caption, fontWeight: .bold)

            Text("Custom")
                .textStyle(font: .system(size: 15), color: .pink)

            Text("Blue title")
                .textStyle(font: .title, color: .blue)
        }
    }
}
#endif
