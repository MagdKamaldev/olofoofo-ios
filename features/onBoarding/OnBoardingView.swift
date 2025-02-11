import SwiftUI

struct OnBoardingView: View {
    @State private var currentTab = 0
    @State private var navigateToLogin = false
    // State variable to control navigation
    
    var body: some View {
        ZStack {
            // Onboarding Screens
            if !navigateToLogin {
                TabView(selection: $currentTab) {
                    OnBoarding1View(currentTab: $currentTab, navigateToLogin: $navigateToLogin)
                        .tag(0)
                    OnBoarding2View(currentTab: $currentTab, navigateToLogin: $navigateToLogin)
                        .tag(1)
                    OnBoarding3View(currentTab: $currentTab, navigateToLogin: $navigateToLogin)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            
            // LoginScreen - Shows only if navigateToLogin is true
            if navigateToLogin {
                LoginView()
                    .transition(.move(edge: .trailing)) // Transition for smooth animation
                    .zIndex(1) // Ensures LoginScreen appears on top
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
