//
//  Images.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 25/01/2024.
//

import UIKit
import SwiftUI

extension String {
    /// App's colors
    enum Images {
        /// Image asset named bus
        static let busIcon = "bus"
        /// Image asset named bus stop
        static let busStopIcon = "bus stop"
        /// Image asset named finish
        static let finishIcon = "finish"
    }
}

extension UIImage {
    enum Icons {
        /// Image asset named bus
        static let busIcon = UIImage(named: .Images.busIcon)
        /// Image asset named bus stop
        static let busStopIcon = UIImage(named: .Images.busStopIcon)
        /// Image asset named finish
        static let finishIcon = UIImage(named: .Images.finishIcon)
    }
}

enum Images {
    /// Image asset named bus
    static let busIcon = Image(.Images.busIcon)
    /// Image asset named bus stop
    static let busStopIcon = Image(.Images.busStopIcon)
    /// Image asset named finish
    static let finishIcon = Image(.Images.finishIcon)
}
