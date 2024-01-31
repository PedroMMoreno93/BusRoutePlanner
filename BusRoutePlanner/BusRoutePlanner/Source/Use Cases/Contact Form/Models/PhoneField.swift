//
//  PhoneField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

// TODO: documentar
struct PhoneField: ContactFormField {
    let key: String = "phone"
    var value: String
    var isMandatory: Bool = false

    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension PhoneField {
    static let empty = PhoneField(value: "")
}
