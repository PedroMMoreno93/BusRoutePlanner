//
//  BusRoutePlannerApp.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 20/01/2024.
//

import SwiftUI
import UserNotifications

@main
struct BusRoutePlannerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            #if TESTING
            TripListView(viewModel: TestTripListViewModel())
            #else
            TripListView()
            #endif
        }
    }
}
