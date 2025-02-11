import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false

    func login(completion: @escaping (Bool) -> Void) {
        isLoading = true
        
        // Validate input
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertItem = AlertContext.invalidForm
            isLoading = false
            completion(false)
            return
        }

        // Prepare request body
        let requestBody: [String: Any] = [
            "email": email,
            "password": password
        ]

        // Make login request
        NetworkManager.shared.post(
            endpoint: APIConstants.Auth.login,
            body: requestBody,
            requiresAuth: false
        ) { (result: Result<LoginResponse, ErrorModel>) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let loginResponse):
                    // Save the token for future requests
                    UserDefaults.standard.setValue(loginResponse.data.token, forKey: "userToken")
                    print("User Token: \(loginResponse.data.token)")
                    completion(true)
                case .failure(let errorModel):
                    self.alertItem = AlertItem(
                        title: Text("Error"),
                        message: Text(errorModel.message!),
                        dissmissButton: .default(Text("OK"))
                    )
                    completion(false)
                }
            }
        }
    }
}

