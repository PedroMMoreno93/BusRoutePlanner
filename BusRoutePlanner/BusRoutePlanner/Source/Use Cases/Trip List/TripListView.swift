//
//  TripListView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

struct TripListView<ViewModel: TripListViewModelProtocol>: BaseView {
    @StateObject var viewModel: ViewModel

    init(viewModel: ViewModel = TripListViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: Variables
    @State private var orientation: UIDeviceOrientation = .portrait
    private var isPortrait: Bool {
        return orientation.isPortrait
    }
    // MARK: Scalable constants
    @ScaledMetric(relativeTo: .callout) private var titleCornerRadius = 10

    // MARK: Constants
    private let titleVerticalPadding: CGFloat = 12

    var body: some View {
        ZStack {
            map
                .ignoresSafeArea()

            if viewModel.areAvailableTrips {
                tripsCards
            }
        }
        .detectOrientation($orientation)
    }

    private var map: some View {
        GoogleMapsView()
    }

    private var tripsCards: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()

            tripsTitle
                .padding(.horizontal)

            ScrollView(isPortrait ? .horizontal : .vertical, showsIndicators: false) {
                getListForOrientation()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    private func getListForOrientation() -> some View {
        if isPortrait {
            HStack {
                list
            }
        } else {
            VStack {
                list
            }
        }
    }

    private var tripsTitle: some View {
        Text("Available Trips")
            .textStyle(font: .callout, fontWeight: .bold)
            .frame(maxWidth: .infinity)
            .padding(titleVerticalPadding)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: titleCornerRadius))
    }

    private var list: some View {
        ForEach(viewModel.availableTrips, id: \.id) { trip in
            TripCard(model: trip) {
                self.viewModel.selectTrip(trip: trip)
            }
                .padding(.vertical)
                .padding(.leading)
        }
    }
}

#if DEBUG
struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView(viewModel: TripListViewModel(model: .previewTripList))
    }
}
#endif
