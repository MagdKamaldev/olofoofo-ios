import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var navigateToHome = false // State to track navigation

    var body: some View {
        Group {
            if navigateToHome {
                HomeView() // Replace with your actual HomeView
                    .transition(.move(edge: .trailing)) // Optional animation
            } else {
                VStack(alignment: .leading) {
                    // Sign In Title
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 25)
                    
                    // Subheading
                    Text("Enter your credentials")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 50)
                    
                    // Email TextField
                    AppTextField(title: "Email", text: $viewModel.email)
                    
                    // Password TextField
                    AppTextField(title: "Password", text: $viewModel.password, isSecure: true)
                        .padding(.bottom, 50)
                    
                    // Loading Indicator
                    if viewModel.isLoading {
                        LoadingView()
                    }
                    
                    // Done Button
                    if !viewModel.isLoading {
                        Button(action: {
                            viewModel.login { success in
                                if success {
                                    withAnimation {
                                        navigateToHome = true // Navigate to HomeView
                                    }
                                }
                            }
                        }) {
                            AppButton(title: "Done", isWhite: false)
                        }
                        .padding(.bottom, 50)
                    }
                    
                    // Sign Up Text
                    HStack {
                        Text("Do not have an Account?")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // Handle sign up navigation
                        }) {
                            Text("Sign up")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(20)
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dissmissButton)
                }
            }
        }
        .animation(.easeInOut, value: navigateToHome) // Add animation for transition
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
