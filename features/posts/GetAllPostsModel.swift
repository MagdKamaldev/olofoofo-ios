import Foundation

// MARK: - PostResponse
struct GetAllPostsResponse: Codable {
    let status: String
    let data: PostData
}

// MARK: - PostData
struct PostData: Codable {
    let posts: [Post]
}

// MARK: - Post
struct Post: Codable, Identifiable {
    let id: String
    let content: String
    let author: Author
    let likesCount: Int
    let commentsCount: Int
    let media: [String]
    let createdAt: String
    let updatedAt: String
    let isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content, author, likesCount, commentsCount, media, createdAt, updatedAt, isLiked
    }
}

// MARK: - Author
struct Author: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let profileImg: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName, profileImg
    }
}

