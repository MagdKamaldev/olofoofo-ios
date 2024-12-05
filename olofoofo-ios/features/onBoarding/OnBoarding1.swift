import SwiftUI

struct OnBoarding1View: View {
    @Binding var currentTab: Int
    @Binding var navigateToLogin: Bool // Binding to control navigation
    
    var body: some View {
        ZStack {
            Image("ONBOARDING1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .padding(.bottom, 80)
            
            VStack {
                Text("Connect with Friends and Family")
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                
                Text("Connecting with Family and Friends provides a sense of security")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
                
                Button {
                    currentTab = 1 // Move to the next tab when Next is tapped
                } label: {
                    AppButton(title: "Next", isWhite: false)
                }.padding(.bottom, 10)
                
                Button {
                    navigateToLogin = true // Skip and go to LoginScreen (like pushReplacement)
                } label: {
                    AppButton(title: "Skip", isWhite: true)
                }
            }
            .padding(.top, 330)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoarding1View(currentTab: .constant(1), navigateToLogin: .constant(false))
}
