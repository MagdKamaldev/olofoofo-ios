//
//  TokenManager.swift
//  olofoofo-ios
//
//  Created by Macbook on 20/02/2025.
//

import Foundation
import SwiftUI

final class TokenManager {
    static let shared = TokenManager()
    
    @AppStorage("userToken") private var userToken: String = ""
    
    var token: String? {
        get { userToken.isEmpty ? nil : userToken }
        set { userToken = newValue ?? "" }
    }
    
    func clearToken() {
        userToken = ""
    }
}
