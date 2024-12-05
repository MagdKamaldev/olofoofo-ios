//
//  NetworkManager.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "http://192.168.89.188:8080/api/v1/"
    private let loginURL = "auth/login"
    
    private init() {}
    
    func login(email: String, password: String, completed: @escaping (Result<LoginResponse, ErrorModel>) -> Void) {
        guard let url = URL(string:  baseURL + loginURL) else {
            completed(.failure(ErrorModel(message: "Invalid URL", status: "failure")))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completed(.failure(ErrorModel(message: error.localizedDescription, status: "failure")))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(ErrorModel(message: "Invalid server response", status: "failure")))
                return
            }
            
            if httpResponse.statusCode == 200, let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completed(.success(decodedResponse))
                } catch {
                    completed(.failure(ErrorModel(message: "Failed to decode response", status: "failure")))
                }
            } else if let data = data {
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorModel.self, from: data)
                    completed(.failure(errorResponse))
                } catch {
                    completed(.failure(ErrorModel(message: "Unexpected server error", status: "failure")))
                }
            } else {
                completed(.failure(ErrorModel(message: "Unexpected server error", status: "failure")))
            }
        }
        task.resume()
    }
}
