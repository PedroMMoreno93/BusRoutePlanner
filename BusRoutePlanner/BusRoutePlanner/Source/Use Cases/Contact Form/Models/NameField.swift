//
//  NameField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

// TODO: documentar

struct NameField: ContactFormField {
    let key: String = "name"
    var value: String
    var isMandatory: Bool = true
    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension NameField {
    static let empty = NameField(value: "")
}
