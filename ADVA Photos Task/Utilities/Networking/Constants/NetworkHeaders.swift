//
//  APIServiceContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 28/03/2022.
//
import Foundation

/// Enumeration that represents types of Network Headers
typealias HTTPHeaders = [String: String]

enum HTTPHeader {
    static let contentType = "Content-Type"
    static let correlationId = "X-Correlation-Id"
    static let spanId = "X-Span-Id"
    static let authentication = "Authorization"
    static let accpetLanguage = "Accept-Language"
    static let deviceId = "X-Device-Id"
    static let deviceFingerprint = "X-Device-Fingerprint"
    static let apigeeHost = "Host"
    static let userAgent = "User-Agent"
    static let publicKey = "PKey"
    static let timeStamp = "TS"
    static let clientID = "client_id"
    static let jws = "JWS"
    static let signedSoftwareStatement = "SS"
}
