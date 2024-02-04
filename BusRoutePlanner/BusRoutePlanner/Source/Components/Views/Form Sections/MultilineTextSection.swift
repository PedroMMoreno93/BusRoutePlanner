//
//  MultilineTextSection.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI

/* MultilineTextSection */
/// View component that provides a stilyzed multi-line textfield section input.
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
            showBoxStroke: true
        ) {
            VStack {
                MultilineInputText(
                    inputText: $inputText,
                    textLimit: textLimit
                )
                .frame(maxWidth: .infinity, alignment: .trailing)

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

#if DEBUG
struct MultilineTextSection_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextSection(
            field: MultilineTextField.empty,
            inputText: .constant("Message"),
            isValidationTriggered: true,
            textLimit: 250
        )
    }
}
#endif
