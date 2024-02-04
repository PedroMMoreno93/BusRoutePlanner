//
//  IssueManagementTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 04/02/2024.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector
import SwiftData

@testable import BusRoutePlanner

final class IssueManagementSnapsotTests: XCTestCase {
    func test_issueManagementViewSnapshot() {
        let view = IssueManagementView()
        let viewController = UIHostingController(rootView: view)

        assertSnapshot(of: viewController, as: .image)
    }
}
