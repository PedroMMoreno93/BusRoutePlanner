//
//  ContactFormViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI
import SwiftData

/* ContactFormViewModelProtocol */
/// ContactFormView interaction and data definition
protocol ContactFormViewModelProtocol: BaseViewModel {
    var model: ContactFormModelView { get set }
    var isValidationTriggered: Bool { get set }
    func saveIssue(context: ModelContext)
    func deleteIssue(context: ModelContext)
}

/* ContactFormViewModel */
/// Holds all the info that ContactFormView required,
/// besides handling the interaction flow.
class ContactFormViewModel: ContactFormViewModelProtocol {
    @Published var model: ContactFormModelView
    @Published var isSheetPresented: Bool = false
    @Published var status: ViewModelStatus = .empty
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = Texts.Alert.defaultAlertMessage
    @Published var isValidationTriggered: Bool = false
    @Published var savedIssue: Issue?

    init(
        model: ContactFormModelView = .empty
    ) {
        self.model = model
    }

    func saveIssue(context: ModelContext) {
        self.isValidationTriggered = true

        guard model.areAllMandatoryFieldsValid else {
            return
        }

        self.saveIssueInDataBase(context: context)
        self.alertMessage = Texts.Alert.savedIssueMessage
        self.showAlert = true
    }

    func deleteIssue(context: ModelContext) {
        self.isValidationTriggered = false
        self.removeIssueFromDataBase(context: context)
        self.savedIssue = nil
    }

    private func saveIssueInDataBase(context: ModelContext) {
        self.savedIssue = Issue(contactForm: model)
        context.insert(savedIssue!)
    }

    private func removeIssueFromDataBase(context: ModelContext) {
        guard let savedIssue = savedIssue else {
            return
        }
        context.delete(savedIssue)
    }
}
