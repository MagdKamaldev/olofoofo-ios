import SwiftUI

struct OnBoarding2View: View {
    @Binding var currentTab: Int
    @Binding var navigateToLogin: Bool // Binding to control navigation
    
    var body: some View {
        ZStack {
            
            VStack {
                Image("OnBoarding2")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 200, height: 200)
                                   .clipped()
                                   .padding(50)
                Text("Make new friends with ease")
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                
                Text("Allowing you to make new Friends is our Number one priority.....")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
                
                Button {
                    currentTab = 2 // Move to the next tab when Next is tapped
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
    OnBoarding2View(currentTab: .constant(2), navigateToLogin: .constant(false))
}
