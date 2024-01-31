//
//  MultilineTextField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import Foundation
import SwiftUI

// TODO: documentar
struct MultilineTextField: ContactFormField {
    let key: String = "message"
    var value: String = ""
    var isMandatory: Bool = true
    var characterNumberLimit: Int? = 200

    func validateStategy() -> Bool {
       return !self.isEmptyStringValue()
    }
}

extension MultilineTextField {
    static let empty = MultilineTextField()
}
