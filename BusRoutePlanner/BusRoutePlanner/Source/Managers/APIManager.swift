//
//  APIManager.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 25/01/2024.
//

import Foundation
#if !TEST

/// Manager that provides a networking suite to ease api calls.
enum APIManager {
    static func callAPI(
        url: String,
        method: HTTPMethod
    ) async throws -> (Data, URLResponse) {

        guard let url = URL(string: url) else {
            throw APIError.wrongURL
        }
        let request = buildURLRequest(url: url, method: method)
        // Print request

        let (data, response) = try await URLSession.shared.data(for: request)
        return (data, response)
    }

    static func callAPI<ModelServer: Decodable>(
        url: String,
        method: HTTPMethod,
        responseModel: ModelServer.Type
    ) async throws -> ModelServer {

        guard let url = URL(string: url) else {
            throw APIError.wrongURL
        }

        let request = buildURLRequest(url: url, method: method)
        Logger.log(request)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.badResponse
        }

        guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw APIError.clientError("Failed with code: \(httpResponse.statusCode)")
        }
        Logger.log(httpResponse)

        do {
            let modelServer = try JSONDecoder().decode(responseModel, from: data)
            return modelServer
        } catch {
            throw APIError.decode
        }
    }

    static private func buildURLRequest(
        url: URL,
        method: HTTPMethod
    ) -> URLRequest {
        let urlRequest = URLRequest(url: url, method: method)
        return urlRequest
    }
}
#endif

enum APIError: Error {
    case wrongURL
    case badResponse
    case clientError(String)
    case decode
}

public enum HTTPMethod: String {
       case get = "GET"
       case put = "PUT"
       case post = "POST"
       case delete = "DELETE"
       case head = "HEAD"
       case options = "OPTIONS"
       case trace = "TRACE"
       case connect = "CONNECT"
}
