//
//  TripListModelView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import Foundation

/* TripListModelView */
/// Struct that encapsulates a list of TripModelView.
/// - Param: trips: [TripModelView]
struct TripListModelView: BaseModelView {
    var trips: [TripModelView]
}

extension TripListModelView {
    /// Empty model for initialization.
    static let empty = TripListModelView(trips: [])
}

extension TripListModelView {
    /// Model for previews.
    static let previewTripList = TripListModelView(trips: [
        .prewviewMock1,
        .prewviewMock2,
        .prewviewMock3
    ])
}
