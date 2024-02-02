//
//  TripListView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/* TripListView */
/// App's main view. It shows a map overlayed by a list
/// of trips represented displayed as cards.
/// - Parameter viewModel: TripListViewModelProtocol
struct TripListView<ViewModel: TripListViewModelProtocol>: BaseView {
    @StateObject var viewModel: ViewModel

    init(viewModel: ViewModel = TripListViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: Variables
    @State private var orientation: UIDeviceOrientation = .portrait
    @State private var size: CGSize = .zero
    @State private var resetScroll: Bool = false
    @State private var isSheetPresented: Bool = false

    // TODO: Sacar a - styles guide.
    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .callout) with value of 10
    @ScaledMetric(relativeTo: .callout) private var titleCornerRadius = 10
    /// ScaledMetric(relativeTo: .callout) with value of 160
    @ScaledMetric(relativeTo: .callout) private var sheetHeight = 160
    /// ScaledMetric(relativeTo: .body) with value of 220
    @ScaledMetric(relativeTo: .body) private var cardWidth = 220
    /// ScaledMetric(relativeTo: .body) with value of 10
    @ScaledMetric(relativeTo: .body) private var cornerRadius = 10

    // TODO: Sacar a - styles guide.
    // MARK: Constants
    /// Value of 12
    private let titleVerticalPadding: CGFloat = 12
    /// Value of 20
    private let titleHorizontalPortraitPadding: CGFloat = 20
    /// Value of 15
    private let tripsTitleHorizontalPadding: CGFloat = 15
    /// Value of 5
    private let tripsTitleBottomPadding: CGFloat = 5
    /// Value of 15
    private let listVerticalPadding: CGFloat = 5
    /// Value of 5
    private let listHorizontalPadding: CGFloat = 15
    /// Value of 10
    private let shadowRadius: CGFloat = 10

    // MARK: Computed Properties
    private var isPortrait: Bool {
        return orientation.isPortrait
    }

    var body: some View {
        ZStack {
            map
                .ignoresSafeArea()

            if viewModel.areAvailableTrips {
                VStack {
                    VStack {
                        contactButton
                        issuesButton
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    Spacer()
                }
                .padding(.horizontal,
                         isPortrait ? titleHorizontalPortraitPadding : 0
                )
                .background {
                    VStack {
                        Spacer()
                        tripsCards
                    }
                }
            }
        }
        .geometryReader($size)
        .sheet(isPresented: $isSheetPresented, onDismiss: {}, content: {
            if let selectedTrip = viewModel.selectedTrip {
                TripDetailView(model: selectedTrip, isLandsCape: orientation.isLandscape)
                    .presentationDetents([.height(sheetHeight), .large ])
            }
        })
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.alertMessage))
        })
        .detectOrientation($orientation)
        .onChange(of: orientation) {
            resetScroll = true
        }
        .task {
            await viewModel.onAppear()
        }
    }

    private var map: some View {
        GoogleMapsView(selectedTrip: viewModel.selectedTrip) { _ in
        }
    }

    var contactButton: some View {
        NavigationLink {
            ContactFormView()
        } label: {
            StylizedSystemImage(
                systemName: "text.bubble.fill",// TODO: Sacar a - styles guide.
                font: .title3,
                primaryStyle: .white,
                secondaryStyle: .blue,
                tertiaryStyle: .blue
            )
            .padding()
            .withTransparentBackground(
                cornerRadius: cornerRadius,
                shadowRadius: shadowRadius,
                isSelected: false
            )
        }
    }

    var issuesButton: some View {
        NavigationLink {
            IssueManagementView()
        } label: {
            StylizedSystemImage(
                systemName: "folder.fill",// TODO: Sacar a - styles guide.
                font: .title3,
                primaryStyle: .blue,
                secondaryStyle: .white,
                tertiaryStyle: .white
            )
            .padding()
            .withTransparentBackground(
                cornerRadius: cornerRadius,
                shadowRadius: shadowRadius,
                isSelected: false
            )
        }
    }

    private var tripsCards: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()

                tripsTitle
                    .frame(width: isPortrait ? size.width - titleHorizontalPortraitPadding : cardWidth )
                    .padding(.horizontal, tripsTitleHorizontalPadding)
                    .padding(.bottom, tripsTitleBottomPadding)

                ScrollViewReader { proxy in
                    ScrollView(isPortrait ? .horizontal : .vertical, showsIndicators: false) {
                        getListForOrientation()
                    }
                    .onChange(of: self.resetScroll) { _, newValue in
                        if newValue {
                            proxy.scrollTo(0)
                            resetScroll = false
                        }
                    }
                }
            }
            if !isPortrait {
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func getListForOrientation() -> some View {
        if isPortrait {
            HStack(spacing: 0) {
                list
            }
        } else {
            VStack(spacing: 0) {
                list
            }
        }
    }

    private var tripsTitle: some View {
        Text("Available Trips")
            .textStyle(font: .callout, fontWeight: .bold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, titleVerticalPadding)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: titleCornerRadius))
    }

    private var list: some View {
        ForEach(self.viewModel.model.trips, id: \.id) { trip in
            TripCardView(
                trip: trip,
                isSelected: self.viewModel.isTripSelected(trip)
            ) {
                self.viewModel.selectedTrip = trip
                self.isSheetPresented = true
            }
            .padding(.vertical, listVerticalPadding)
            .padding(.horizontal, listHorizontalPadding)
            .id(self.viewModel.getIndexForTrip(trip))
        }
    }
}

#if DEBUG
struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripListView(viewModel: TripListViewModel(model: .previewTripList))
        }
    }
}
#endif
