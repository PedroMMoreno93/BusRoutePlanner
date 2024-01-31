//
//  ContactFormViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI
import SwiftData

protocol ContactFormViewModelProtocol: BaseViewModel {
    var model: ContactFormModelView { get set }
    var isValidationTriggered: Bool { get set }
    func saveIssue(context: ModelContext) 
    func deleteIssue(context: ModelContext)
}

class ContactFormViewModel: ContactFormViewModelProtocol {
    @Published var model: ContactFormModelView
    @Published var isSheetPresented: Bool = false
    @Published var status: ViewModelStatus = .empty
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = "Something went wrong."
    @Published var isValidationTriggered: Bool = false
    @Published var savedIssue: Issue?

    init(
        model: ContactFormModelView = .empty
    ) {
        self.model = model
    }

    /// TODO: metodo para validar
    /// - todos los campos menos phone es opcional.
    /// Hay que comprobar si están vacios
    /// hay que comprobar si email es formato correct
    ///
    /// - feedback usuario -> scroll to position
    ///     en rojo las secciones obligatorias
    ///
    /// - alerta pop -> informa de error
    /// - sistema de guardado en UserDefaults-- y ondeleted...
    /// - badge
    /// - Vista de alertas pasadas
    ///
    func saveIssue(context: ModelContext) {
        self.isValidationTriggered = true
        
    
        guard model.areAllMandatoryFieldsValid else {
            return
        }
        
        self.saveIssueInDataBase(context: context)
        self.alertMessage = "Issue saved!"
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
