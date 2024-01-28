//
//  PointModelServer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation

/* PointModelServer */
/// Codable structure that holds the information that defines a greographic point.
/// - Parameter:
///     - latitude: Double
///     - longitude: Double
///
/// CodingKeys
/// - latitude = "_latitude"
/// - longitude = "_longitude"
struct PointModelServer: Codable {
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
}
