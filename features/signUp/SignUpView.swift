import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @State private var navigateToHome = false
    @State private var showSignIn = false

    var body: some View {
        NavigationStack {
            Group {
                if navigateToHome {
                    HomeTabView()
                        .transition(.move(edge: .trailing))
                } else {
                    VStack(alignment: .leading, spacing: 16) {
                        // Title
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        // Form Fields
                        AppTextField(title: "First Name", text: $viewModel.firstName)
                        AppTextField(title: "Last Name", text: $viewModel.lastName)
                        AppTextField(title: "Email", text: $viewModel.email)
                        AppTextField(title: "Password", text: $viewModel.password, isSecure: true)

                        // Loading Indicator
                        if viewModel.isLoading {
                            LoadingView()
                        }

                        // Sign Up Button
                        if !viewModel.isLoading {
                            Button(action: {
                                viewModel.signUp { success in
                                    if success {
                                        // Navigate to Home on successful signup
                                        withAnimation {
                                            navigateToHome = true
                                        }
                                    }
                                }
                            }) {
                                AppButton(title: "Sign Up", isWhite: false)
                                    .frame(maxWidth: .infinity, minHeight: 50)
                            }
                            .disabled(viewModel.isLoading)
                            .opacity(viewModel.isLoading ? 0.5 : 1)
                            .padding(.vertical, 10)
                        }

                        // Sign In Navigation
                        HStack {
                            Text("Already have an account?")
                                .font(.footnote)
                                .foregroundColor(.gray)

                            Button(action: {
                                showSignIn = true
                            }) {
                                Text("Sign In")
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
                    .navigationDestination(isPresented: $showSignIn) {
                        LoginView()
                    }
                }
            }
            .animation(.easeInOut, value: navigateToHome)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
