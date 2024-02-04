//
//  TextFieldSection+Initializers.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 02/02/2024.
//

import SwiftUI

extension TextFieldSection {
    /* TextFieldSection */
    /// Initializer from a generic ContactFormField
    /// - Parameters:
    ///     - field: ContactFormField.
    ///     - inputText:  Binding<String>
    ///     - isValidationTriggered: Bool
    init<Field: ContactFormField>(
        field: Field,
        inputText: Binding<String>,
        isValidationTriggered: Bool
    ) {
        let title = field.key.capitalized(with: .current)

        let shouldShowWarning = field.isMandatory && isValidationTriggered && !field.validateStategy()

        self.init(
            sectionTitle: title,
            text: inputText,
            placeholder: title,
            isMandatory: field.isMandatory,
            shouldShowWarning: shouldShowWarning
        )
    }
}
