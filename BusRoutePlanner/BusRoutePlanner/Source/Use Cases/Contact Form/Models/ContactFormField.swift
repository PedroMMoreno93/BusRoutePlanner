//
//  ContactFormField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI

/* ContactFormField */
/// Protocol that defines a generic field model and
///  its needed set of features and functions.
protocol ContactFormField: Codable {
    associatedtype Value: Codable
    var key: String { get }
    var value: Value { get set }
    var isMandatory: Bool { get }
    func validateStategy() -> Bool
}

extension ContactFormField {
    func isEmptyStringValue() -> Bool {
        guard let stringValue = self.value as? String else {
            return true
        }

        return stringValue.isEmpty
    }
}
