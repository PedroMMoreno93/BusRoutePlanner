//
//  AddressModelServer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation
/* AddressModelServer */
/// Codable structure that represents an address.
/// - Parameter:
///     - point: Double
///     - address: String
struct AddressModelServer: Codable {
    let point: PointModelServer
    let address: String
}
