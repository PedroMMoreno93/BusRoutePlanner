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
        /// System image named arrow.backward
        static let backButtonIcon = "arrow.backward"
        /// System image named square.and.arrow.down.fill
        static let saveButtonIcon = "square.and.arrow.down.fill"
        /// System image named text.bubble.fill
        static let contactButtonIcon = "text.bubble.fill"
        /// System image named folder.fill
        static let issuesButtonIcon = "folder.fill"
        /// System image named circle
        static let issueListRowIcon = "circle"
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
        /// System image named arrow.backward
        static let backButtonIcon =  UIImage(systemName: .Images.backButtonIcon)
        /// System image named square.and.arrow.down.fill
        static let saveButtonIcon =  UIImage(systemName: .Images.saveButtonIcon)
        /// System image named text.bubble.fill
        static let contactButtonIcon =  UIImage(systemName: .Images.contactButtonIcon)
        /// System image named folder.fill
        static let issuesButtonIcon =  UIImage(systemName: .Images.issuesButtonIcon)
        /// System image named circle
        static let issueListRowIcon =  UIImage(systemName: .Images.issueListRowIcon)
    }
}

extension Image {
    enum Icons {
        /// Image asset named bus
        static let busIcon = Image(.Images.busIcon)
        /// Image asset named bus stop
        static let busStopIcon = Image(.Images.busStopIcon)
        /// Image asset named finish
        static let finishIcon = Image(.Images.finishIcon)
        /// System image named arrow.backward
        static let backButtonIcon = Image(systemName: .Images.backButtonIcon)
        /// System image named square.and.arrow.down.fill
        static let saveButtonIcon = Image(systemName: .Images.saveButtonIcon)
        /// System image named text.bubble.fill
        static let contactButtonIcon = Image(systemName: .Images.contactButtonIcon)
        /// System image named folder.fill
        static let issuesButtonIcon = Image(systemName: .Images.issuesButtonIcon)
        /// System image named circle
        static let issueListRowIcon = Image(systemName: .Images.issueListRowIcon)
    }
}
