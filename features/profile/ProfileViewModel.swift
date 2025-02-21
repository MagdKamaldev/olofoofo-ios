//
//  ProfileViewModel.swift
//  olofoofo-ios
//
//  Created by Macbook on 20/02/2025.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var user: UserProfile? = nil
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    func fetchProfile() {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.get(endpoint: APIConstants.User.profile, requiresAuth: true) { (result: Result<ProfileResponse, ErrorModel>) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    self.user = response.data.user.first
                case .failure(let error):
                    self.errorMessage = error.message
                }
            }
        }
    }
}
