//
//  MultilineTextSection+Initializers.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 02/02/2024.
//

import SwiftUI

extension MultilineTextSection {
    /* MultilineTextSection */
    /// Initializer from a generic ContactFormField
    /// - Parameters:
    ///     - field: ContactFormField.
    ///     - inputText:  Binding<String>
    ///     - isValidationTriggered: Bool
    ///     - textLimit: Int?
    init<Field: ContactFormField>(
        field: Field,
        inputText: Binding<String>,
        isValidationTriggered: Bool,
        textLimit: Int?
    ) {
        let title = field.key.capitalized(with: .current)

        let shouldShowWarning = field.isMandatory && isValidationTriggered && !field.validateStategy()

        self.init(
            sectionTitle: title,
            placeholder: title,
            isMandatory: field.isMandatory,
            shouldShowWarning: shouldShowWarning,
            inputText: inputText,
            textLimit: textLimit
        )
    }
}
