//
//  ProfileModel.swift
//  olofoofo-ios
//
//  Created by Macbook on 18/02/2025.
//

import Foundation

// MARK: - Root Response
struct ProfileResponse: Codable {
    let status: String
    let data: ProfileData
}

// MARK: - Profile Data
struct ProfileData: Codable {
    let user: [UserProfile]
}

// MARK: - User Profile
struct UserProfile: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let friends: [String]
    let friendRequests: [String]
    let sentRequests: [String]
    let profileImg: String?
    let bio: String?
    let posts: [Post]
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName, email, friends, friendRequests, sentRequests, profileImg, bio, posts, createdAt, updatedAt
    }
}
