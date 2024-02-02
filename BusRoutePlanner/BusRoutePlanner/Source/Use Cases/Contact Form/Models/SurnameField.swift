//
//  SurnameField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

/* SurnameField */
/// Struct that implements a surname field of type contact form field.
/// - Parameters:
///     - key: String. Default value "surname".
///     - value: String. Empty by default.
///     - isMandatory: Bool. Set to false.
struct SurnameField: ContactFormField {
    var key: String = "surname"
    var value: String
    var isMandatory: Bool = true

    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension SurnameField {
    static let empty = SurnameField(value: "")
    static let mock = SurnameField(value: "Sparrow")

}
