//
//  MultilineTextField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

/* MultilineTextField */
/// Struct that implements a multi-line text field of type contact form field.
/// - Parameters:
///     - key: String. Default value "message".
///     - value: String. Empty by default.
///     - isMandatory: Bool. Set to true.
///     - characterNumberLimit: Int?.  Default value of 200.
struct MultilineTextField: ContactFormField {
    var id = UUID()
    var key: String = "text"
    var value: String = ""
    var valueString: String {
        return value
    }
    var isMandatory: Bool = true
    var characterNumberLimit: Int? = 200

    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension MultilineTextField {
    static let empty = MultilineTextField()
    static let mock = MultilineTextField(value: "why is the rum always gone")
}
