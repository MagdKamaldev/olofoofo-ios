//
//  LoginModel.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import Foundation

// Request Model
struct LoginRequest: Codable {
    let email: String
    let password: String
}

// Response Model
struct LoginResponse: Codable {
    let status: String
    let data: LoginData
}

struct LoginData: Codable {
    let user: User
    let token: String
}

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let friends: [String]
    let friendRequests: [String]
    let sentRequests: [String]
    let createdAt: String
    let updatedAt: String
    
    // Map `_id` from the JSON to `id` in Swift
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName, email, password, friends, friendRequests, sentRequests, createdAt, updatedAt
    }
}
