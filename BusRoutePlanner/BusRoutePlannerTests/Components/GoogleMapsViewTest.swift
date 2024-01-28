//
//  GoogleMapsViewTest.swift
//  BusRoutePlannerTests
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation

import XCTest
import SwiftUI
import SnapshotTesting
import ViewInspector
@testable import BusRoutePlanner

final class GoogleMapsViewTest: XCTestCase {
    func test_initWithAnimatedTransition() {
        var sut = GoogleMapsView(
            selectedTrip: nil,
            animatedTransition: true
        ) {
        } mapViewWillMove: { _ in
        }
        sut.selectedTrip = .prewviewMock1
        XCTAssertEqual(sut.selectedTrip, .prewviewMock1)
    }

    func test_initWithNotAnimatedTransition() {
        var sut = GoogleMapsView(
            selectedTrip: nil,
            animatedTransition: false
        ) {
        } mapViewWillMove: { _ in
        }
        sut.selectedTrip = .prewviewMock1
        XCTAssertEqual(sut.selectedTrip, .prewviewMock1)
    }
}
