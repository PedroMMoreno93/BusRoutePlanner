//
//  MultilineTextSection.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI

struct MultilineTextSection: View {
    var sectionTitle: String
    var placeholder: String
    var isMandatory: Bool
    var shouldShowWarning: Bool
    @Binding var inputText: String
    var textLimit: Int?

    var body: some View {
        ContactFormSectionView(
            sectionTitle: sectionTitle,
            placeholder: placeholder,
            isMandatory: isMandatory,
            shouldShowWarning: shouldShowWarning,
            showBoxStroke: false,
            horizontalPadding: 0,
            verticalPadding: 0
        ) {
            VStack {
                MultilineInputText(
                    inputText: $inputText,
                    textLimit: textLimit
                )

                charCountLabel
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }

    @ViewBuilder
    private var charCountLabel: some View {
        if let textLimit = textLimit {
            Text("\(inputText.count) / \(textLimit)")
               .font(.caption)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    MultilineTextSection(
        field: MultilineTextField.empty,
        inputText: .constant("Message"),
        isValidationTriggered: true,
        textLimit: 250
    )
}
