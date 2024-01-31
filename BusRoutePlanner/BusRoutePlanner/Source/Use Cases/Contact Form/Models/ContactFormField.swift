//
//  ContactFormField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI

// TODO: documentar
protocol ContactFormField: Codable {
    associatedtype Value: Codable
    var key: String { get }
    var value: Value { get set }
    var isMandatory: Bool { get }
    func validateStategy() -> Bool
}

extension ContactFormField {
    func isEmptyStringValue() -> Bool {
        guard let stringValue = self.value as? String else {
            return true
        }

        return stringValue.isEmpty
    }
}

extension TextFieldSection {
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

extension MultilineTextSection {
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
