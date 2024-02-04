//
//  ArchitectureExampleView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/* ArchitectureExampleView */
/// This example view implements the BaseView protocol, and 
/// takes advantadge of generics to define the use case view model
/// protocol injection, leaving room to inject different classes
/// that implement the view model.
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
