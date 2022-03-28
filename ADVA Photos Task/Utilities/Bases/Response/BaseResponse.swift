//
//  BaseResponse.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 29/03/2022.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var code: Int?
    var data: T?
}
