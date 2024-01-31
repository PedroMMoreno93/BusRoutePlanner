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
    }
}

enum Colors {
    /// Color asset named primaryText
    static let primaryText = Color(.Colors.primatyText)
    /// Color asset named boxStroke
    static let boxStroke = Color(.Colors.boxStroke)
}

extension Color {
    /// System's background color
    static let background = Color(UIColor.systemBackground)
    /// System's secondary background color
    static let secondaryBackground = Color(UIColor.secondarySystemBackground)
    /// System's tertiary background color
    static let tertiaryBackground = Color(UIColor.tertiarySystemBackground)
}
