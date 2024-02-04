//
//  Date+String.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 23/01/2024.
//

import Foundation

extension Date {
    /* dateFromString */
    /// Returns date from a string date with a specific format.
    ///
    /// - Parameters:
    ///     - date: String
    ///     - format: String. Default yyyy-MM-dd HH:mm, ex: "2023-05-19 10:30"
    /// - Returns: Date
    static func dateFromString(
        _ date: String,
        _ format: String = "yyyy-MM-dd HH:mm"
    ) -> Date? {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = format

        // Convert String to Date
        return dateFormatter.date(from: date)
    }

    /* stringFromDate */
    /// Returns string from a date with a specific format.
    ///
    /// - Parameters:
    ///     - date: Date. self.
    ///     - format: String.
    /// - Returns: Date
    func stringFromDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: self)
    }
}

extension String {
    /* dateFromString */
    /// Returns date from a string date with a specific format.
    ///
    /// - Parameters:
    ///     - date: String. self.
    ///     - format: String. Default yyyy-MM-dd HH:mm, ex: "2023-05-19 10:30"
    /// - Returns: Date
    func dateFromString(_ format: String = "yyyy-MM-dd HH:mm") -> Date? {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = format

        // Convert String to Date
        return dateFormatter.date(from: self)
    }

    /* stringFromDate */
    /// Returns string from a date with a specific format.
    ///
    /// - Parameters:
    ///     - date: Date
    ///     - format: String.
    /// - Returns: Date
    static func stringFromDate(_ date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: date)
    }
}
