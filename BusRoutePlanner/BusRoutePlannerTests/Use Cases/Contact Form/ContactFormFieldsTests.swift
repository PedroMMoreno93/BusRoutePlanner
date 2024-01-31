//
//  ContactFormFieldsTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 31/01/2024.
//

import Foundation
import XCTest
@testable import BusRoutePlanner

final class ContactFormFieldsTests: XCTestCase {
    func test_nameField() {
        let name = "name"
        let nameField = NameField(value: name)
        XCTAssertEqual(nameField.value, name)

        XCTAssertTrue(nameField.isMandatory)

        let isValid = nameField.validateStategy()
        XCTAssertTrue(isValid)
    }

    func test_surnameField() {
        let surname = "surname"
        let surnameField = SurnameField(value: surname)
        XCTAssertEqual(surnameField.value, surname)

        XCTAssertTrue(surnameField.isMandatory)

        let isValid = surnameField.validateStategy()
        XCTAssertTrue(isValid)
    }

    func test_emailField() {
        let email = "email"
        let emailField = EmailField(value: email)
        XCTAssertEqual(emailField.value, email)

        XCTAssertTrue(emailField.isMandatory)

        let isValid = emailField.validateStategy()
        XCTAssertFalse(isValid)
    }

    func test_phoneField() {
        let phone = "phone"
        let phoneField = PhoneField(value: phone)
        XCTAssertEqual(phoneField.value, phone)
        
        XCTAssertFalse(phoneField.isMandatory)
        
        let isValid = phoneField.validateStategy()
        XCTAssertTrue(isValid)
    }

    func test_messageField() {
        let message = "message"
        let messageField = MultilineTextField(value: message)
        XCTAssertEqual(messageField.value, message)

        XCTAssertTrue(messageField.isMandatory)

        let isValid = messageField.validateStategy()
        XCTAssertTrue(isValid)
    }
}
