//
//  TripCard.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

struct TripCard: View {
    // MARK: Variables
    let model: TripCardModelView

    // MARK: Scalable constants
    @ScaledMetric(relativeTo: .body) private var cardWidth = 220
    @ScaledMetric(relativeTo: .body) private var cardHeight = 110
    @ScaledMetric(relativeTo: .body) private var cornerRadius = 10

    // MARK: Constants
    private let verticalSpacing: CGFloat = 4
    private let shadowRadius: CGFloat = 10

    var body: some View {
        Button {

        } label: {
            label
        }
    }

    var label: some View {
        VStack(alignment: .leading, spacing: verticalSpacing) {
            HStack {
                driverName
                Spacer()
                status
            }
            .padding(.bottom, verticalSpacing)

            origin

            arrival
        }
        .frame(width: cardWidth, height: cardHeight, alignment: .center)
        .padding(.horizontal, verticalSpacing * 2)
        .padding(.vertical, verticalSpacing)
        .background(
            .thinMaterial
        )
        .clipShape(
            RoundedRectangle(cornerRadius: cornerRadius)
        )
        .shadow(
            radius: shadowRadius
        )
    }

    var driverName: some View {
        Text(model.driverName)
            .font(.title3)
            .foregroundStyle(.primaryText)
    }

    var origin: some View {
        Text("From \(model.origin)")
            .textStyle()
    }

    var destination: some View {
        Text(model.destination)
            .textStyle()
    }

    var status: some View {
        Image(systemName: model.status.systemIcon)
            .font(.title3)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.white, model.status.color, model.status.color)
    }

    var arrival: some View {
        HStack(spacing: 0) {
            Text("Arrival at ")
                .textStyle()

            Text(model.endTimeString)
                .textStyle(fontWeight: .bold)
        }
    }
}

#if DEBUG
struct TripCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.teal
            TripCard(model: .previewOngoingTrip)
        }
    }
}
#endif
