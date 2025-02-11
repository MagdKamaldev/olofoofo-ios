//
//  ErrorModel.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import Foundation

struct ErrorModel : Codable ,Error {
    let message:String?
    let status:String?
}
