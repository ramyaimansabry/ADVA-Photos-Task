//
//  ErrorResolver.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 29/03/2022.
//

import Foundation

final class ErrorResolver {
    static let shared = ErrorResolver()
    
    private init() {}
    
    func getError(code: Int, reason: String? = nil) -> BaseError {
        var type: ErrorType = .unexpected
        
        switch code {
        case ErrorConstants.Range.unwrappedHttpClientRange: type = .unwrappedHttpClient
        case ErrorConstants.Range.unwrappedHttpServerRange: type = .unwrappedHttpServer
        case ErrorConstants.Range.wrappedHttpClientRange: type = .wrappedHttpClient
        case ErrorConstants.Range.wrappedHttpServerRange: type = .wrappedHttpServer
        default: type = .unexpected
        }
        
        return .init(
            code: code,
            message: type.message
        )
    }
    
    func getError(for type: ErrorType, message: String? = nil) -> BaseError {
        return .init(
            code: type.code,
            message: message ?? type.message
        )
    }
}
