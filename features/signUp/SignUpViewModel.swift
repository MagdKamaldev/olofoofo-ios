import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false

    func signUp(completion: @escaping (Bool) -> Void) {
        isLoading = true
        
        // Input validation with specific error messages
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertItem = AlertContext.invalidForm
            isLoading = false
            completion(false)
            return
        }

        // Prepare request body
        let requestBody: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
        ]
        
        print("Sending signup request with body: \(requestBody)")  // Debugging line

        // Make signup request
        NetworkManager.shared.post(
            endpoint: APIConstants.Auth.register,
            body: requestBody,
            requiresAuth: false
        ) { (result: Result<SignUpResponse, ErrorModel>) in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    print("Signup Success! Response: \(response)")  // Debugging line
                    // Save the token for future requests
                    UserDefaults.standard.setValue(response.data.token, forKey: "userToken")
                    self.alertItem = nil  // Clear any previous alert
                    completion(true)  // Trigger success
                    
                case .failure(let errorModel):
                    print("Signup Error! Status: \(errorModel.status ?? "No status available")")
                    // Debugging line
                    // Handle error and show an alert
                    self.alertItem = AlertItem(
                        title: Text("Error"),
                        message: Text(errorModel.status ?? "An unknown error occurred"),
                        dissmissButton: .default(Text("OK"))
                    )
                    completion(false)  // Trigger failure
                }
            }
        }
    }
}
