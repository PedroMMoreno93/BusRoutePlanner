//
//  ArchitectureExampleTests.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 22/01/2024.
//

import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector

@testable import BusRoutePlanner

final class ArchitectureExampleTests: XCTestCase {

    func test_setColor() throws {

        let viewModel = ArchitectureExampleViewModel()

        // Test initial state
        XCTAssertEqual(viewModel.model.color, Color.blue)

        viewModel.setColor(.red)

        XCTAssertEqual(viewModel.model.color, Color.red)
    }
}

final class ArchitectureExampleUITests: XCTestCase {

    func test_pressRedButton() throws {

        let viewModel = ArchitectureExampleViewModel()
        let sut = ArchitectureExampleView(viewModel: viewModel)

        // Test initial state
        XCTAssertEqual(viewModel.model.color, Color.blue)

        let button = try sut.inspect().find(button: "Red")
        try button.tap()

        XCTAssertEqual(viewModel.model.color, Color.red)
    }

    func test_pressBlueButton() throws {

        let viewModel = ArchitectureExampleViewModel(model: ArchitectureExampleModelView(name: "Test", color: .yellow))
        let sut = ArchitectureExampleView(viewModel: viewModel)

        // Test initial state
        XCTAssertEqual(viewModel.model.color, Color.yellow)

        let button = try sut.inspect().find(button: "Blue")
        try button.tap()

        XCTAssertEqual(viewModel.model.color, Color.blue)
    }
}

final class ArchitectureExampleSnapshotTests: XCTestCase {

    func test_snapshot() {
        let view = ArchitectureExampleView(viewModel: ArchitectureExampleViewModel())
        let viewController = UIHostingController(rootView: view)

        assertSnapshot(of: viewController, as: .image)
    }

}
