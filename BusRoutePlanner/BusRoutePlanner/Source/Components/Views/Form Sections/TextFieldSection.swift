//
//  TextFieldSection.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI

/* TextFieldSection */
/// View component that provides a stilyzed textfield section input.
struct TextFieldSection: View {

    // MARK: Variables
    var sectionTitle: String
    @Binding var text: String
    var placeholder: String
    var isMandatory: Bool
    var shouldShowWarning: Bool

    // MARK: Constants
    /// Value of 18
    private let verticalSpacing: CGFloat = 18
    /// Value of 18
    private let horizontalTextfieldPadding: CGFloat = 20

    // MARK: Computed properties
    private var sectionTitleText: String {
        return isMandatory ? sectionTitle + "*" : sectionTitle
    }

    var body: some View {
        ContactFormSectionView(
            sectionTitle: sectionTitle,
            placeholder: placeholder,
            isMandatory: isMandatory,
            shouldShowWarning: shouldShowWarning
        ) {
            TextField(placeholder, text: $text)
        }
    }
}

#if DEBUG
struct TextFieldSection_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldSection(field: NameField.empty, inputText: .constant("Name"), isValidationTriggered: true)
    }
}
#endif
