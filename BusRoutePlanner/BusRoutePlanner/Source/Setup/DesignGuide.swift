//
//  DesignSystem.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 04/02/2024.
//

import SwiftUI

enum DesignGuide {
    enum Basics {
        /// Default value set to 160.
        static let sheetHeight: CGFloat = 160
        /// Default value set to 12.
        static let titleVerticalPadding: CGFloat = 12
        /// Default value set to 15.
        static let titleHorizontalPadding: CGFloat = 15
        /// Default value set to 5.
        static let titleBottomPadding: CGFloat = 5
    }

    enum Radius {
        /// Default value set to 10.
        static let cornerRadius: CGFloat = 10
        /// Default value set to 10.
        static let shadowRadius: CGFloat = 10
    }

    enum Card {
        /// Default value set to 220.
        static let width: CGFloat = 220
        /// Default value set to 110.
        static let height: CGFloat = 110
        ///  Default value set to 5.
        static let verticalSpacing: CGFloat = 5
        ///  Default value set to 2.
        static let strokeWidth: CGFloat = 2
    }

    enum List {
        /// Default value set to 5.
        static let verticalPadding: CGFloat = 5
        /// Default value set to 15.
        static let horizontalPadding: CGFloat = 15
        /// Default value set to 10.
        static let verticalSpacing: CGFloat = 10
        /// Default value set to 24.
        static let sectionsVerticalSpacing: CGFloat = 24
        /// Default value set to 10.
        static let  sectionsTopPadding: CGFloat = 10
    }

    enum Stops {
        /// Default value set to 30.
        static let circleWidth: Double = 30
        /// Default value set to 40.
        static let lineLength: Double = 40
    }

    enum TextField {
        /// Default value set to 18.
        static let verticalSpacing: Double = 18
        /// Default value set to 20.
        static let horizontalTextfieldPadding: Double = 20
    }

    enum Map {
        /// Default value set to 4.
        static let polilyneStrokeWidth: CGFloat = 4
        /// Default value set to 0.5.
        static let animationStepDuration: Double = 0.5
        /// Default value set to 12.
        static let animationZoom: Float = 12
    }
}
