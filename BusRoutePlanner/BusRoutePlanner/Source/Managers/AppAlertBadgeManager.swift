//
//  AppAlertBadgeManager.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 31/01/2024.
//

import SwiftUI

class AppAlertBadgeManager: ObservableObject {
    @MainActor
    func setAlertBadge(number: Int) {
        UNUserNotificationCenter.current().setBadgeCount(number, withCompletionHandler: nil)
    }

    @MainActor
    func resetAlertBadgetNumber() {
        UNUserNotificationCenter.current().setBadgeCount(0, withCompletionHandler: nil)
    }
}
