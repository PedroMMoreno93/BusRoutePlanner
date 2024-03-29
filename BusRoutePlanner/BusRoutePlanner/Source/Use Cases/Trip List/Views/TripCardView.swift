//
//  TripCard.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/* TripCardView */
/// View that shows a very small amount of information of a trip.
/// - Parametera:
///     - model: TripCardModelView.
///     - action: () -> Void. Calls back when pressed.
struct TripCardView: View {
    // MARK: Variables
    let model: TripCardModelView
    var isSelected: Bool
    var action: () -> Void

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of 220
    @ScaledMetric(relativeTo: .body) private var cardWidth = DesignGuide.Card.width
    /// ScaledMetric(relativeTo: .body) with value of 110
    @ScaledMetric(relativeTo: .body) private var cardHeight = DesignGuide.Card.height
    /// ScaledMetric(relativeTo: .body) with value of 10
    @ScaledMetric(relativeTo: .body) private var cornerRadius = DesignGuide.Radius.cornerRadius

    // MARK: Constants
    /// Value of 4
    private let verticalSpacing: CGFloat = DesignGuide.List.verticalSpacing
    /// Value of 10
    private let shadowRadius: CGFloat = DesignGuide.Radius.shadowRadius

    var body: some View {
        Button {
            self.action()
        } label: {
            label
        }
    }

    private var label: some View {
        VStack(alignment: .leading, spacing: verticalSpacing) {
            HStack {
                driverName
                Spacer()
                status
            }
            .padding(.bottom, verticalSpacing)

            arrival

            origin
        }
        .padding(.horizontal, verticalSpacing * 2)
        .padding(.vertical, verticalSpacing)
        .frame(width: cardWidth, height: cardHeight, alignment: .center)
        .glassBackground(
            cornerRadius: cornerRadius,
            shadowRadius: shadowRadius,
            isSelected: isSelected
        )
    }

    private var driverName: some View {
        Text(model.driverName)
            .font(.title3)
            .foregroundStyle(.primaryText)
            .lineLimit(1)
    }

    private var origin: some View {
        Text(LocalizedKeys.TripList.fromLabel.stringValue() + "\(model.origin)")
            .textStyle()
            .lineLimit(1)
    }

    private var status: some View {
        StylizedSystemImage(
            systemName: model.status.systemIcon,
            font: .title3,
            primaryStyle: .white,
            secondaryStyle: model.status.color,
            tertiaryStyle: model.status.color
        )
    }

    private var arrival: some View {
        HStack(spacing: 0) {
            Text(LocalizedKeys.TripList.arrivalAtLabel)
                .textStyle()

            Text(model.endTimeString)
                .textStyle(fontWeight: .bold)
        }
    }
}

extension TripCardView {
    init(trip: TripModelView, isSelected: Bool, action: @escaping (() -> Void)) {
        self.model = TripCardModelView(
            driverName: trip.driverName,
            origin: trip.origin.address,
            destination: trip.destination.address,
            status: trip.status,
            startTime: trip.startTime,
            endTime: trip.endTime
        )
        self.action = action
        self.isSelected = isSelected
    }
}

#if DEBUG
struct TripCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.teal
            TripCardView(model: .previewOngoingTrip, isSelected: true) {
            }
        }
    }
}
#endif
