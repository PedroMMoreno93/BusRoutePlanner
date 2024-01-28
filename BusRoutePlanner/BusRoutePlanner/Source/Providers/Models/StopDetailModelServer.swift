//
//  StopDetailModelServer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation

/* StopDetailModelServer */
/// Codable structure that holds the detailed information that defines a stop.
/// - Parameter:
///     - price: Double
///     - address: String
///     - tripID: Int
///     - paid: Bool
///     - stopTime: String
///     - point: PointModelServer
///     - userName: String
///
/// CodingKeys
/// - tripID = "tripId"
struct StopDetailModelServer: Codable {
    let price: Double
    let address: String
    let tripID: Int
    let paid: Bool
    let stopTime: String
    let point: PointModelServer
    let userName: String

    enum CodingKeys: String, CodingKey {
        case price, address
        case tripID = "tripId"
        case paid, stopTime, point, userName
    }
 }

extension StopDetailModelServer {
    static let mockStopDetailModelServer = StopDetailModelServer(
        price: 1.5,
        address: "Ramblas, Barcelona",
        tripID: 1,
        paid: true,
        stopTime: "2018-12-18T08:10:00.000Z",
        point: PointModelServer(
            latitude: 41.37653,
            longitude: 2.17924
        ),
        userName: "Manuel Gomez"
    )
}
