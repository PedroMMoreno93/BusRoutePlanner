//
//  AppAlertBadgeManager.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 31/01/2024.
//

import SwiftUI

/* AppAlertBadgeManager */
/// Manager used to handle app's icon badge number value.
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
