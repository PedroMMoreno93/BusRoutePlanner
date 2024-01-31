//
//  Issue.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 30/01/2024.
//

import Foundation
import SwiftData

@Model
class Issue: Identifiable {
    var id: UUID
    var contactForm: ContactFormModelView
    var issuedDate: Date

    init(contactForm: ContactFormModelView) {
        self.id = UUID()
        self.contactForm = contactForm
        self.issuedDate = Date.now
    }
}
