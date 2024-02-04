//
//  Texts.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 04/02/2024.
//

import Foundation
import SwiftUI

// swiftlint:disable nesting
enum LocalizedKeys {
    enum TripList {
        static let tripsTitle: LocalizedStringKey = "tripList_tripsTitle"
        static let defaultAlertMessage: LocalizedStringKey =  "tripList_defaultAlertMessage"
        static let stopsSectionTitle: LocalizedStringKey = "tripList_stopsSectionTitle"
        static let departureTitle: LocalizedStringKey = "tripList_fromLabel"
        static let arrivalTitle: LocalizedStringKey = "tripList_arrivalTitle"
        static let fromLabel: LocalizedStringKey = "From "
        static let arrivalAtLabel: LocalizedStringKey = "tripList_arrivalAtLabel"
    }

    enum Buttons {
        static let okLabel: LocalizedStringKey = "buttons_okLabel"
        static let cancelLabel: LocalizedStringKey = "buttons_cancelLabel"
    }

    enum ContactForm {
        static let contactTitle: LocalizedStringKey = "contactForm_contactTitle"

        enum FieldKeys {
            static let name: LocalizedStringKey = "name"
            static let surname: LocalizedStringKey = "surname"
            static let email: LocalizedStringKey = "email"
            static let phone: LocalizedStringKey = "phone"
            static let multilineText: LocalizedStringKey = "text"
        }
    }

    enum IssueManagement {
        static let issueListTitle: LocalizedStringKey = "issueManagement_issueListTitle"
        static let issueTitleLabel: LocalizedStringKey = "issueManagement_issueTitleLabel"
    }

    enum Alert {
        static let defaultAlertMessage: LocalizedStringKey = "alert_defaultAlertMessage"
        static let savedIssueMessage: LocalizedStringKey = "alert_savedIssueMessage"
    }
}
// swiftlint:enable nesting
