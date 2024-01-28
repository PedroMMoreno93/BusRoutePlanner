//
//  ArchitectureExample.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI
/*
 This file provides an example use case that implements the base
 architecture.
 For further information, please consult ARCHITECTURE.md.
 */

struct ArchitectureExampleModelView: BaseModelView {
    var name: String
    var color: Color
}

protocol ArchitectureExampleViewModelProtocol: BaseViewModel {
    var model: ArchitectureExampleModelView { get set }
    func setColor(_ color: Color)
}

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

struct ArchitectureExampleView<
    ViewModel: ArchitectureExampleViewModelProtocol
>: BaseView {
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            HStack {

                Circle()
                    .fill(viewModel.model.color)
                    .frame(width: 24)

                Text(viewModel.model.name)
            }

            HStack {
                Button {
                    viewModel.setColor(.blue)
                } label: {
                    Text("Blue")
                }
                .buttonStyle(.borderedProminent)
                .accentColor(.blue)

                Button {
                    viewModel.setColor(.red)
                } label: {
                    Text("Red")
                }
                .buttonStyle(.borderedProminent)
                .accentColor(.red)
            }
        }
    }
}

#if DEBUG
struct ArchitectureExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ArchitectureExampleView(viewModel: ArchitectureExampleViewModel())
    }
}
#endif
