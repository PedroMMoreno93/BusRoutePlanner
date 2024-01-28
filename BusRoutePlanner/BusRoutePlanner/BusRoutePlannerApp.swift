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

    /* body */
    /// This is the main body of the app's view.
    /// 
    /// By using custom flags, it is posible to determine which
    /// dependencies are injected at the birth of the app.
    ///
    /// The testing suite can have a controlled set of dependencies,
    /// avoiding network calls for instance.
    var body: some Scene {
        WindowGroup {
            TripListView()
        }
    }
}
