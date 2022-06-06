//
//  RequestModel.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation
/// Define enumeration for http method.
enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

/// Define protocol for request.
protocol RequestModel {
    var path: String { get set }
    var parameters: [String: String]? { get set }
    var headers: [String: String] { get set }
    var method: RequestHTTPMethod { get set }
    var body: [String: Any]? { get set }
}

/// Extension of request model for add new functionality.
extension RequestModel {
    
    /// Adding new method for create URL request.
    /// - Returns: Base on RequestModel parameters return URLRequest.
    func urlRequest() -> URLRequest {
        var endpoint: String = ServiceManager.shared.baseURL.appending(path)
        
        if let parameters = parameters {
            for parameter in parameters {
                endpoint.append("?\(parameter.key)=\(parameter.value)")
            }
        }
        
        var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
        
        request.httpMethod = method.rawValue
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if method == RequestHTTPMethod.post, let body = body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                print("Request body parse error: \(error.localizedDescription)")
            }
        }
        
        return request
    }
}
