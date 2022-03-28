//
//  NetworkConstants.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 28/03/2022.
//

import Foundation

public enum NetworkConstants {
    enum Range {
        static let successCodes = 2000...2999
    }
    
    static let createdStatusCode = 2001
    static let retries: Int = 3
    static let baseUrl: String = getBaseUrl()
    
    static let timeoutIntervalForRequest: Double = 120
    
    private static func getBaseUrl() -> String {
        let scheme = EnvironmentManager.shared.string(key: .serverScheme)
        let host = EnvironmentManager.shared.string(key: .serverHost)
        let port = EnvironmentManager.shared.string(key: .serverPort)
        
        return "\(scheme)://\(host):\(port)"
    }
}
