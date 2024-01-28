//
//  URLRequestInitializers.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 27/01/2024.
//

import Foundation

#if !TEST
extension URLRequest {
    public init(
        url: URL,
        method: HTTPMethod,
        contentType: String? = nil
    ) {
        self.init(url: url)
        self.httpMethod = method.rawValue
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
    }

    public init(
        url: URL,
        method: HTTPMethod,
        contentType: String?,
        body: Data?
    ) {
        self.init(url: url)
        self.httpMethod = method.rawValue
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
        self.httpBody = body
    }

    public init(
        url: URL,
        method: HTTPMethod,
        contentType: String?,
        cachePolicy: CachePolicy,
        timeoutInterval: TimeInterval
    ) {
        self.init(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        self.httpMethod = method.rawValue
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
    }
}
#endif
