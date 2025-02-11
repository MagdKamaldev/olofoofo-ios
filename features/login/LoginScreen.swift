import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var navigateToHome = false
    @State private var showSignUp = false // Add state for signup navigation
    
    var body: some View {
        NavigationStack {  // Wrap in NavigationStack
            Group {
                if navigateToHome {
                    HomeTabView()
                        .transition(.move(edge: .trailing))
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
                                            navigateToHome = true
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
                                showSignUp = true 
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
                        Alert(title: alertItem.title,
                              message: alertItem.message,
                              dismissButton: alertItem.dissmissButton)
                    }
                    .navigationDestination(isPresented: $showSignUp) {
                        SignUpView()
                    }
                }
            }
            .animation(.easeInOut, value: navigateToHome)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
