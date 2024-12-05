import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func login(completion: @escaping (Bool) -> Void) {
        isLoading = true
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertItem = AlertContext.invalidForm
            isLoading = false
            completion(false)
            return
        }
        
        NetworkManager.shared.login(email: email, password: password) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let loginResponse):
                    print("User Token: \(loginResponse.data.token)")
                    completion(true)
                case .failure(let errorModel):
                    self.alertItem = AlertItem(
                        title: Text("Error"),
                        message: Text(errorModel.message ?? errorModel.localizedDescription),
                        dissmissButton: .default(Text("OK"))
                    )
                    completion(false)
                }
            }
        }
    }
}
