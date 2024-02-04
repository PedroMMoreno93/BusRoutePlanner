//
//  EmailField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

/* EmailField */
/// Struct that implements a email field of type contact form field.
/// - Parameters:
///     - key: String. Default value "email".
///     - value: String. Empty by default.
///     - isMandatory: Bool. Set to false.
struct EmailField: ContactFormField {
    var id = UUID()
    var key: String = LocalizedKeys.ContactForm.FieldKeys.email.stringKey
    var value: String
    var valueString: String {
        return value
    }
    var isMandatory: Bool = true

    func validateStategy() -> Bool {
        return self.isValidEmail(value)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

extension EmailField {
    static let empty = EmailField(value: "")
    static let mock = EmailField(value: "jacksparrow@captain.pirate")
}
