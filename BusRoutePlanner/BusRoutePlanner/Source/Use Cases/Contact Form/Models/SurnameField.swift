//
//  SurnameField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

// TODO: documentar
struct SurnameField: ContactFormField {
    let key: String = "surname"
    var value: String
    var isMandatory: Bool = true

    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension SurnameField {
    static let empty = SurnameField(value: "")
}
