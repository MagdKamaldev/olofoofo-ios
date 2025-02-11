//
//  SignUpModel.swift
//  olofoofo-ios
//
//  Created by Macbook on 30/01/2025.
//
import Foundation

// Request Model
struct SignUpRequest: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

// MARK: - Response Models
struct SignUpResponse: Codable {
    let status: String
    let data: SignUpData
}

struct SignUpData: Codable {
    let user: User
    let token: String
}
