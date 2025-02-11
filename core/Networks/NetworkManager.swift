import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - Generic Request Function
    private func request<T: Decodable>(
        url: String,
        method: String,
        body: [String: Any]? = nil,
        requiresAuth: Bool = false,
        completion: @escaping (Result<T, ErrorModel>) -> Void
    ) {
        guard let url = URL(string: APIConstants.baseURL + url) else {
            completion(.failure(ErrorModel(message: "Invalid URL", status: "failure")))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Add authorization header if required
        if requiresAuth, let token = UserDefaults.standard.string(forKey: "userToken") {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        // Add the body if provided
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(ErrorModel(message: error.localizedDescription, status: "failure")))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(ErrorModel(message: "Invalid server response", status: "failure")))
                    return
                }

                if httpResponse.statusCode <= 299, let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedResponse))
                    } catch {
                        completion(.failure(ErrorModel(message: "Failed to decode response", status: "failure")))
                    }
                } else if let data = data {
                    do {
                        let errorResponse = try JSONDecoder().decode(ErrorModel.self, from: data)
                        completion(.failure(errorResponse))
                    } catch {
                        completion(.failure(ErrorModel(message: "Unexpected server error", status: "failure")))
                    }
                } else {
                    completion(.failure(ErrorModel(message: "Unexpected server error", status: "failure")))
                }
            }
        }
        task.resume()
    }

    // MARK: - Public API Methods (GET, POST, PUT, DELETE, PATCH)
    func get<T: Decodable>(endpoint: String, requiresAuth: Bool = false, completion: @escaping (Result<T, ErrorModel>) -> Void) {
        request(url: endpoint, method: "GET", requiresAuth: requiresAuth, completion: completion)
    }

    func post<T: Decodable>(endpoint: String, body: [String: Any], requiresAuth: Bool = false, completion: @escaping (Result<T, ErrorModel>) -> Void) {
        request(url: endpoint, method: "POST", body: body, requiresAuth: requiresAuth, completion: completion)
    }

    func put<T: Decodable>(endpoint: String, body: [String: Any], requiresAuth: Bool = false, completion: @escaping (Result<T, ErrorModel>) -> Void) {
        request(url: endpoint, method: "PUT", body: body, requiresAuth: requiresAuth, completion: completion)
    }

    func delete<T: Decodable>(endpoint: String, requiresAuth: Bool = false, completion: @escaping (Result<T, ErrorModel>) -> Void) {
        request(url: endpoint, method: "DELETE", requiresAuth: requiresAuth, completion: completion)
    }

    func patch<T: Decodable>(endpoint: String, body: [String: Any], requiresAuth: Bool = false, completion: @escaping (Result<T, ErrorModel>) -> Void) {
        request(url: endpoint, method: "PATCH", body: body, requiresAuth: requiresAuth, completion: completion)
    }
}

