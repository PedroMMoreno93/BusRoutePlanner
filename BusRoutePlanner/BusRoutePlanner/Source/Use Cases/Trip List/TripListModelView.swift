//
//  TripListModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import Foundation

struct TripListModelView: BaseModelView {
    var trips: [TripCardModelView]
}

extension TripListModelView {
    static let empty = TripListModelView(trips: [])
}

extension TripListModelView {
    static let previewTripList = TripListModelView(trips: [
        .previewOngoingTrip,
        .previewCancelledTrip,
        .previewShceduledTrip,
        .previewFinalizedTrip
    ])
}
