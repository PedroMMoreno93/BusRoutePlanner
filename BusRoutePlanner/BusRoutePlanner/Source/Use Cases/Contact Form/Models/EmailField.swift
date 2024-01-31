//
//  EmailField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

// TODO: documentar
struct EmailField: ContactFormField {
    var key: String = "email"
    var value: String
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
}
