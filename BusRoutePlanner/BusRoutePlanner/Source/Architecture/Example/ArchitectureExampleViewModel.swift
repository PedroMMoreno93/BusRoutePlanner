//
//  ArchitectureExampleViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 02/02/2024.
//

import SwiftUI

/* ArchitectureExampleViewModelProtocol */
/// Protocol that will define the use case view's interaction while holding the data model needed by the view.
protocol ArchitectureExampleViewModelProtocol: BaseViewModel {
    var model: ArchitectureExampleModelView { get set }
    func setColor(_ color: Color)
}

/* ArchitectureExampleViewModel */
/// This is the main implementation of the ArchitectureExampleViewModelProtocol,
///  where the specific implementation defined by the protocol takes place.
class ArchitectureExampleViewModel: ArchitectureExampleViewModelProtocol {

    // MARK: Variables
    @Published var status: ViewModelStatus = .empty
    @Published var model: ArchitectureExampleModelView
    @Published var showAlert: Bool = false
    @Published  var isSheetPresented: Bool = false
    @Published var alertMessage: String = "Something went wrong."

    init(
        model: ArchitectureExampleModelView = ArchitectureExampleModelView(
            name: "Jack Sparrow",
            color: .blue
        )
    ) {
        self.model = model
    }

    func setColor(_ color: Color) {
        self.model.color = color
    }
}
