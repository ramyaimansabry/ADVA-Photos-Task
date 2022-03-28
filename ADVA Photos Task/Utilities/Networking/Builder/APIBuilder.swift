//
//  APIBuilder.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 29/03/2022.
//

import Foundation

class APIBuilder {
    private(set) var urlRequest: URLRequest
   
    init() {
        guard let url = URL(string: NetworkConstants.baseUrl) else {
            fatalError("Could not create URL: \(NetworkConstants.baseUrl)")
        }
        
        self.urlRequest = URLRequest(url: url)
    }
    
    @discardableResult
    func setHost(using host: String) -> APIBuilder {
        self.urlRequest.url = URL(string: host)
        return self
    }
    
    @discardableResult
    func setPath(using path: APIConstants) -> APIBuilder {
        setPath(using: path, argument: [])
        return self
    }
    
    @discardableResult
    func setPath(using path: APIConstants, argument: CVarArg) -> APIBuilder {
        setPath(using: path, argument: [argument])
    }
    
    @discardableResult
    func setMethod(using method: HTTPMethod) -> APIBuilder {
        self.urlRequest.httpMethod = method.rawValue
        return self
    }
    
    @discardableResult
    func setHeaders(using headers: HTTPHeaders) -> APIBuilder {
        for (key, value) in headers {
            self.urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        return self
    }
    
    @discardableResult
    func setParameters(using parameters: RequestParams) -> APIBuilder {
        switch parameters {
        case .body(let params):
            do {
                self.urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                fatalError("Could not serialize \(params)")
            }

        case .query(let params):
            let queryParams = params.map { pair in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            
            if let url = self.urlRequest.url {
                var components = URLComponents(string: url.absoluteString)
                components?.queryItems = queryParams
                
                self.urlRequest.url = components?.url
            }
        }
        
        return self
    }
  
    func build() -> URLRequest {
        guard let url = self.urlRequest.url, !url.pathComponents.isEmpty else {
            fatalError("API should contain at least one path.")
        }
        
        self.urlRequest.setValue(ContentType.json, forHTTPHeaderField: HTTPHeader.contentType)
        
        let uuid = UUID().uuidString
        self.urlRequest.setValue(uuid, forHTTPHeaderField: HTTPHeader.correlationId)
        self.urlRequest.setValue(uuid, forHTTPHeaderField: HTTPHeader.spanId)
        
//        if let bearer = token {
//            self.urlRequest.setValue("Bearer \(bearer)", forHTTPHeaderField: HTTPHeader.authentication)
//        }
        
        return self.urlRequest
    }
}
