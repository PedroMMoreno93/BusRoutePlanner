//
//  ContactFormTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 31/01/2024.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector
import SwiftData

@testable import BusRoutePlanner

final class ContactFormViewModelTests: XCTestCase {
    var viewModel: (any ContactFormViewModelProtocol)?

    func test_init() {
        let model: ContactFormModelView = .empty
        self.viewModel = ContactFormViewModel(model: model)

        XCTAssertEqual("", viewModel!.model.name.value)
    }

    func test_saveIssue() throws {
        let model: ContactFormModelView = .empty
        self.viewModel = ContactFormViewModel(model: model)
        let context = try ModelContext(
            ModelContainer(
                for: Issue.self,
                configurations: .init(isStoredInMemoryOnly: true)
            )
        )

        viewModel?.saveIssue(context: context)
        XCTAssertTrue(viewModel!.isValidationTriggered)
      }

    func test_deleteIssue() throws {
        let model: ContactFormModelView = .empty
        self.viewModel = ContactFormViewModel(model: model)
        let context = try ModelContext(
            ModelContainer(
                for: Issue.self,
                configurations: .init(isStoredInMemoryOnly: true)
            )
        )

        viewModel?.deleteIssue(context: context)
        XCTAssertTrue(!viewModel!.isValidationTriggered)
      }
}

final class ContactFormSnapsotTests: XCTestCase {
    func test_snapshot() {
        let view = ContactFormView(
            viewModel: ContactFormViewModel(model: .empty)
        ).environmentObject(AppAlertBadgeManager())

        let viewController = UIHostingController(rootView: view)

        assertSnapshot(of: viewController, as: .image)
    }
}
