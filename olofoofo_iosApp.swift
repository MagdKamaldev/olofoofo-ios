//
//  olofoofo_iosApp.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import SwiftUI

@main
struct olofoofo_iosApp: App {
    @AppStorage("userToken") private var userToken: String = ""
    
    var body: some Scene {
        WindowGroup {
            if userToken.isEmpty {
                OnBoardingView()
            } else {
                HomeTabView()
            }
        }
    }
}
