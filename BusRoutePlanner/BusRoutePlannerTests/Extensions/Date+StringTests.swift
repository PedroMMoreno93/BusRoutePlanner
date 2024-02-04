//
//  Date+StringTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import XCTest
@testable import BusRoutePlanner

final class DateParsersTest: XCTestCase {

    func test_dateParsers() {
        let format = "yyyy-MM-dd HH:mm"
        let stringDateInput = "2024-01-02 10:30"

        let dateFromString = Date.dateFromString(stringDateInput, format)
        let stringFromDate = dateFromString?.stringFromDate(format: format)

        XCTAssertEqual(stringDateInput, stringFromDate)
    }
}

final class StringExtensionsTest: XCTestCase {
    func test_stringParsers() {
        let format = "yyyy-MM-dd HH:mm"
        let dateInput = Date.dateFromString("2024-01-02 10:30", format)

        let stringDateInput = String.stringFromDate(dateInput!, format: format)

        XCTAssertEqual(stringDateInput.dateFromString(), dateInput)
    }
}
