//
//  Colors.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

extension String {
    /// App's colors
    enum Colors {
        /// Color asset named primaryText
        static let primatyText = "primaryText"
        /// Color asset named boxStroke
        static let boxStroke = "boxStroke"
        /// Color asset named secondaryColor
        static let secondaryBackgroundColor = "secondaryBackgroundColor"
    }
}

enum Colors {
    /// Color asset named primaryText
    static let primaryText = Color(.Colors.primatyText)
    /// Color asset named boxStroke
    static let boxStroke = Color(.Colors.boxStroke)
    /// Color asset named secondaryColor
    static let secondaryBackgroundColor = Color(.Colors.secondaryBackgroundColor)
}

extension Color {
    /// System's background color
    static let systemBackground = Color(UIColor.systemBackground)
    /// System's secondary background color
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    /// System's tertiary background color
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)
}
