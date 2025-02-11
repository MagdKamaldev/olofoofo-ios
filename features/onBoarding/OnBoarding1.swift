import SwiftUI

struct OnBoarding1View: View {
    @Binding var currentTab: Int
    @Binding var navigateToLogin: Bool // Binding to control navigation
    
    var body: some View {
        ZStack {
               
            VStack {
                Image("OnBoarding1")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 200, height: 200)
                                   .clipped()
                                   .padding(50)
                
                Text("Connect with Friends and Family")
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                
                Text("Connecting with Family and Friends provides a sense of security")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
                
                Button {
                    currentTab = 1
                } label: {
                    AppButton(title: "Next", isWhite: false)
                }.padding(.bottom, 10)
                
                Button {
                    navigateToLogin = true // Skip and go to LoginScreen (like pushReplacement)
                } label: {
                    AppButton(title: "Skip", isWhite: true)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoarding1View(currentTab: .constant(1), navigateToLogin: .constant(false))
}
