//
//  Secrets.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 20/01/2024.
//

import Foundation
// swiftlint:disable nesting

/* Secrets */
/// This file provided by the codeowner contain different sentitive values that are needed for the project
enum Secrets {
    enum API {
        enum GoogleMaps {
            static let key = "AIzaSyBPkE9Tuq7mbcicNMp3Lw_1uqAtVjWlxSw"
        }

        enum Provider {
            static let tripsUrl = "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/trips.json"
            static let stopsUrl = "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/stops.json"
        }
    }
}
// swiftlint:enable nesting
