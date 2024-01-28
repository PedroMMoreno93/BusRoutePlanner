//
//  AdressModelServer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation
/* AdressModelServer */
/// Codable structure that represents an adress.
/// - Parameter:
///     - point: Double
///     - address: String
struct AdressModelServer: Codable {
    let point: PointModelServer
    let address: String
}
