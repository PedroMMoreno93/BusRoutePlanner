//
//  Texts.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 04/02/2024.
//

import Foundation

// swiftlint:disable nesting
enum Texts {
    enum TripList {
        static let tripsTitle = "Available Trips"
        static let defaultAlertMessage =  """
                Something went wrong.
                Please restart the app.
                If the problem persists, get in contact with the administrator
        """
        static let tripsTidtle = "Available Trips"
        static let stopsSectionTitle = "Stops"
        static let departureTitle = "Departure"
        static let arrivalTitle = "Arrival"
        static let fromLabel = "From "
        static let arrivalAtLabel = "Arrival at "

    }

    enum Buttons {
        static let okLabel = "Ok"
        static let cancelLabel = "Ok"

    }

    enum ContactForm {
        static let contactTitle = "Contact"

        enum FieldKeys {
            static let name = "name"
            static let surname = "surname"
            static let email = "email"
            static let phone = "phone"
            static let multilineText = "text"
        }
    }

    enum IssueManagement {
        static let issueListTitle = "Issues"

        static let issueTitleLabel = "Issue from "
    }

    enum Alert {
        static let defaultAlertMessage = "Something went wrong."
        static let savedIssueMessage = "Issue saved!"
    }
}
// swiftlint:enable nesting
