import Foundation

struct APIConstants {
    static let baseURL = "http://192.168.1.5:8080/api/v1/"

    struct Auth {
        static let login = "auth/login/"
        static let register = "auth/signup/"
    }
    
    struct User {
        static let profile = "users/me"
        static let updateProfile = "user/update"
    }
    
    struct Posts {
        static let fetchPosts = "posts"
        static let createPost = "posts/create"
        static let updatePost = "posts/update/"
        static let deletePost = "posts/delete/"
    }
}

