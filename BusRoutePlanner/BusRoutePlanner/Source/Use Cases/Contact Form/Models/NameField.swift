//
//  NameField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

/* NameField */
/// Struct that implements a name field of type contact form field.
/// - Parameters:
///     - key: String. Default value "name".
///     - value: String. Empty by default.
///     - isMandatory: Bool. Set to false.
struct NameField: ContactFormField {
    var id = UUID()
    var key: String = LocalizedKeys.ContactForm.FieldKeys.name.stringKey
    var value: String
    var valueString: String {
        return value
    }

    var isMandatory: Bool = true
    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension NameField {
    static let empty = NameField(value: "")
    static let mock = NameField(value: "Jack")
}
