//
//  PhoneField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

/* PhoneField */
/// Struct that implements a phone field of type contact form field.
/// - Parameters:
///     - key: String. Default value "phone".
///     - value: String. Empty by default.
///     - isMandatory: Bool. Set to false.
struct PhoneField: ContactFormField {
    var id = UUID()
    var key: String = LocalizedKeys.ContactForm.FieldKeys.phone.stringKey
    var value: String
    var valueString: String {
        return value
    }
    var isMandatory: Bool = false

    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension PhoneField {
    static let empty = PhoneField(value: "")
    static let mock = PhoneField(value: "123456789")
}
