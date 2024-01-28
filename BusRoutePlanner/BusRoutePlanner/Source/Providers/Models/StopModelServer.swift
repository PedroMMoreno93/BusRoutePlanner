//
//  StopModelServer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation

/* StopModelServer */
/// Codable structure that holds brief information of a stop.
/// - Parameter:
///     - point: PointModelServer?
///     - id: Int?
struct StopModelServer: Codable {
    let point: PointModelServer?
    let id: Int?
}
