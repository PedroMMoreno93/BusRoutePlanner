//
//  ContactFormModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI

// TODO: documentar
struct ContactFormModelView: BaseModelView, Codable {
    var name: NameField
    var surname: SurnameField
    var email: EmailField
    var phone: PhoneField
    var inputText: MultilineTextField
}

extension ContactFormModelView {
    static let empty = ContactFormModelView(
        name: .empty,
        surname: .empty,
        email: .empty,
        phone: .empty,
        inputText: .empty
    )
}

extension ContactFormModelView {
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
