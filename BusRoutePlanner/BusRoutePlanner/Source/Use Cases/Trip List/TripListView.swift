//
//  TripListView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI
import SwiftData

/* TripListView */
/// App's main view. It shows a map overlayed by a list
/// of trips represented displayed as cards.
/// - Parameter viewModel: TripListViewModelProtocol
struct TripListView<ViewModel: TripListViewModelProtocol>: BaseView {
    @Environment(\.modelContext) private var context
    @Query private var issues: [Issue]

    @StateObject var viewModel: ViewModel

    init(viewModel: ViewModel = TripListViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: Variables
    @State private var size: CGSize = .zero
    @State private var isSheetPresented: Bool = false

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of 10
    @ScaledMetric(relativeTo: .body) private var cornerRadius = DesignGuide.Radius.cornerRadius
    /// ScaledMetric(relativeTo: .callout) with value of 160
    @ScaledMetric(relativeTo: .callout) private var sheetHeight = DesignGuide.Basics.sheetHeight
    /// ScaledMetric(relativeTo: .body) with value of 220
    @ScaledMetric(relativeTo: .body) private var cardWidth = DesignGuide.Card.width

    // MARK: Constants
    // Default value set to DesignSystem.Basics.titleVerticalPadding.
    private let titleVerticalPadding: CGFloat = DesignGuide.Basics.titleVerticalPadding
    // Default value set to DesignSystem.Basics.titleHorizontalPadding.
    private let titleHorizontalPadding: CGFloat = DesignGuide.Basics.titleHorizontalPadding
    // Default value set to DesignSystem.Basics.titleBottomPadding.
    private let tripsTitleBottomPadding: CGFloat = DesignGuide.Basics.titleBottomPadding
    // Default value set to DesignSystem.List.verticalPadding.
    private let listVerticalPadding: CGFloat = DesignGuide.List.verticalPadding
    // Default value set to DesignSystem.List.horizontalPadding.
    private let listHorizontalPadding: CGFloat = DesignGuide.List.horizontalPadding
    // Default value set to DesignSystem.Radius.shadowRadius.
    private let shadowRadius: CGFloat = DesignGuide.Radius.shadowRadius
    // Default value set to .background.
    private let buttonForegroundColor: Color = .systemBackground
    // Default value set to .background.
    private let buttonBackgroundColor: Color = .systemBackground

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
                .padding(.horizontal, titleHorizontalPadding)
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
                TripDetailView(model: selectedTrip)
                    .presentationDetents([.height(sheetHeight), .large ])
            }
        })
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.alertMessage))
        })
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
                systemName: .Images.contactButtonIcon,
                font: .title3,
                primaryStyle: buttonBackgroundColor,
                secondaryStyle: buttonForegroundColor,
                tertiaryStyle: buttonForegroundColor
            )
            .padding()
            .glassBackground(
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
                systemName: .Images.issuesButtonIcon,
                font: .title3,
                primaryStyle: buttonForegroundColor,
                secondaryStyle: buttonForegroundColor,
                tertiaryStyle: buttonForegroundColor
            )
            .padding()
            .glassBackground(
                cornerRadius: cornerRadius,
                shadowRadius: shadowRadius,
                isSelected: false
            )
            .customBadge(issues.count)
        }
    }

    private var tripsCards: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()

            tripsTitle
                .frame(width: size.width - titleHorizontalPadding)
                .padding(.horizontal, titleHorizontalPadding)
                .padding(.bottom, tripsTitleBottomPadding)

            ScrollView(.horizontal, showsIndicators: false) {
                list                    }
        }
    }

    private var tripsTitle: some View {
        Text(Texts.TripList.tripsTitle)
            .textStyle(font: .callout, fontWeight: .bold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, titleVerticalPadding)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    private var list: some View {
        HStack(spacing: 0) {
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
