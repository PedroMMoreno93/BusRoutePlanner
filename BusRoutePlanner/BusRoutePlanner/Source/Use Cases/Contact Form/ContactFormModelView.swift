//
//  ContactFormModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI

/* ContactFormModelView */
/// Struct that holds the fields included in the contact form.
/// - Parameters:
///     - name: NameField. Key = "name". Mandatory.
///     - surname: SurnameField. Key = "surname". Mandatory.
///     - email: EmailField. Key = "email". Mandatory.
///     - phone: PhoneField. Key = "phone". Not mandatory.
///     - inputText: MultilineTextField. Key = "message". Mandatory.
struct ContactFormModelView: BaseModelView, Codable {
    var name: NameField
    var surname: SurnameField
    var email: EmailField
    var phone: PhoneField
    var inputText: MultilineTextField
}

extension ContactFormModelView {

    /// Empty ContactFormModelView
    static let empty = ContactFormModelView(
        name: .empty,
        surname: .empty,
        email: .empty,
        phone: .empty,
        inputText: .empty
    )

    /// Mocked ContactFormModelView
    static let mock = ContactFormModelView(
        name: .mock,
        surname: .mock,
        email: .mock,
        phone: .mock,
        inputText: .mock
    )
}

extension ContactFormModelView {

    // MARK: Update when a new field is introduced in the definition of the Model
    var allFields: [any ContactFormField] {
        return [
            name, surname, email, phone, inputText
        ]
    }

    var areAllMandatoryFieldsValid: Bool {
        let firstNonValid = allFields.first { field in
            field.isMandatory && !field.validateStategy()
        }

        return firstNonValid == nil
    }
}
