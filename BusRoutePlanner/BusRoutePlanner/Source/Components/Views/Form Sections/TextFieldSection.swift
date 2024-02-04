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

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of 18.
    @ScaledMetric(relativeTo: .body) private var verticalSpacing = 18
    /// ScaledMetric(relativeTo: .body) with value of 20.
    @ScaledMetric(relativeTo: .body) private var horizontalTextfieldPadding = 20

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
