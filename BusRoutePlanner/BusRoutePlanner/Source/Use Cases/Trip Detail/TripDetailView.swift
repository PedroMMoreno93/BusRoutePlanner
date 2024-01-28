//
//  TripDetailView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import SwiftUI

/* TripDetailView */
/// View that shows the detailed information of a trip.
/// - Parameters:
///     - model: TripModelView.
///     - dismissModal: () -> Void. This is to support sheet dismiss in landscapeMode
struct TripDetailView: View {
    let model: TripModelView
    var isLandsCape: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
            List {
                Section {
                  departureArrival
                } header: {
                    HStack {
                        status

                        title

                        Spacer()

                        if isLandsCape {
                            backButton
                        }
                    }
                }

                if !model.stops.isEmpty {

                    Section {
                        StopsVisualizer(model: model)
                    } header: {
                        HStack {
                           Text("Stops")

                        }
                    }
                }
            }
    }

    private var title: some View {
        Text(model.description)
            .font(.body)
    }

    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image(systemName: "arrow.backward")
                Text("Back")
            }
            .foregroundStyle(.blue)
        }
    }

    private var status: some View {
        StylizedSystemImage(
            systemName: model.status.systemIcon,
            font: .body,
            primaryStyle: .white,
            secondaryStyle: model.status.color,
            tertiaryStyle: model.status.color
        )
    }

    private var departureArrival: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Text("Departure")
                Spacer()
                Text("Arrival")
            }
            .font(.title3)
            HStack(spacing: 0) {
                Text(model.origin.address)
                Spacer()
                Text(model.destination.address)
            }

            HStack(spacing: 0) {
                Text(model.startTimeString)
                Spacer()
                Text(model.endTimeString)
            }
        }
    }

    private var departure: some View {
        HStack(spacing: 0) {
            Text("Departure at ")
            Text(model.startTimeString)
        }
    }

    private var arrival: some View {
        HStack(spacing: 0) {
            Text("Arrival at ")
            Text(model.endTimeString)
        }
    }
}

#if DEBUG
struct TripDetailViewPreviewWrapper: View {
    @State private var orientation: UIDeviceOrientation = .portrait
    @State private var isPresented: Bool = true

    var body: some View {
        ZStack {
            Color.teal
            Button {
                isPresented.toggle()
            } label: {
                Text("Present Sheet")
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $isPresented, content: {
            TripDetailView(model: .prewviewMock1, isLandsCape: orientation.isLandscape)
                .presentationDetents([.height(160), .large])
        })
        .detectOrientation($orientation)
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailViewPreviewWrapper()
    }
}
#endif
