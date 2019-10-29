//
//  MockURLSession.swift
//  ApolloTestSupport
//
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import Foundation

public final class MockURLSession: URLSession {
  public private (set) var lastRequest: URLRequest?

  public var data: Data?
  public var response: URLResponse?
  public var error: Error?

  override public func dataTask(with request: URLRequest) -> URLSessionDataTask {
    lastRequest = request
    return URLSessionDataTaskMock()
  }
  
  override public func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    lastRequest = request
    completionHandler(data, response, error)
    return URLSessionDataTaskMock()
  }
}

private final class URLSessionDataTaskMock: URLSessionDataTask {
  override func resume() {

  }
}
