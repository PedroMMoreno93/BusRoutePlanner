//
//  Logger.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 25/01/2024.
//

import Foundation

enum Logger {
    /* log */
    /// This function provides a print wrapper to ensure no print is added into a release version.
    /// - Parameters:
    ///     - items: Any...
    ///     - separator: String. Blank space by default.
    ///     - terminator: String. New line by default.
    static func log(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        print(items, separator: separator, terminator: terminator)
        #else
        return
        #endif
    }
}
