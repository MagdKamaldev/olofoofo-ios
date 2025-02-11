import SwiftUI

struct OnBoarding3View: View {
    @Binding var currentTab: Int
    @Binding var navigateToLogin: Bool // Binding to control navigation
    
    var body: some View {
        ZStack {
            
            VStack {
                Image("OnBoarding3")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 200, height: 200)
                                   .clipped()
                                   .padding(50)
                Text("Express yourself to the world")
                    .font(.title)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                
                Text("Let your voice be heard on the internet through the OFOFO features on the App without restrictions")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
                
                Button {
                    navigateToLogin = true // Continue and go to LoginScreen (like pushReplacement)
                } label: {
                    AppButton(title: "Continue", isWhite: false)
                }
                .padding(.top, 10)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoarding3View(currentTab: .constant(3), navigateToLogin: .constant(false))
}
