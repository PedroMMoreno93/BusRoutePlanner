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
    // MARK: Variables
    let model: TripModelView
    @Environment(\.dismiss) private var dismiss

    // MARK: Constants
    /// Default value set to 10
    private let verticalSpacing: CGFloat = DesignGuide.List.verticalSpacing

    var body: some View {
        List {
            Section {
                departureArrival
            } header: {
                HStack {
                    status

                    title

                    Spacer()
                }
            }

            if !model.stops.isEmpty {

                Section {
                    StopsVisualizer(model: model)
                } header: {
                    Text(LocalizedKeys.TripList.stopsSectionTitle)
                }
            }
        }
    }

    private var title: some View {
        Text(model.description)
            .font(.body)
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
        VStack(spacing: verticalSpacing) {
            HStack(spacing: 0) {
                Text(LocalizedKeys.TripList.departureTitle)
                Spacer()
                Text(LocalizedKeys.TripList.arrivalTitle)
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
}

#if DEBUG
/* TripDetailViewPreviewWrapper */
/// Wrapper to test the view in the previews.
/// This is needed due to the sheet interaction flow, that needs a state variable.
struct TripDetailViewPreviewWrapper: View {
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
            TripDetailView(model: .prewviewMock1)
                .presentationDetents([.height(160), .large])
        })
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailViewPreviewWrapper()
    }
}
#endif
