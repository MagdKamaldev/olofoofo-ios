//
//  olofoofo_iosApp.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import SwiftUI

@main
struct olofoofo_iosApp: App {
    @State private var userToken = TokenManager.shared.token
    var body: some Scene {
        WindowGroup {
            if userToken == nil {
                OnBoardingView()
            } else {
                HomeTabView()
            }
        }
    }
}
