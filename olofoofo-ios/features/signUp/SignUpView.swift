import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            // Sign In Title
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            // Subheading
            Text("Enter your credentials")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 25)
            
            //firstName textfield
            AppTextField(title: "First Name", text: $firstName)
            //lastName textfield
            AppTextField(title: "Last Name", text: $lastName)
            
            // Email TextField
            AppTextField(title: "Email", text: $email)
            
            // Password TextField
            AppTextField(title: "Password", text: $password, isSecure: true)
                .padding(.bottom ,30)
            
            // Done Button
            Button(action: {
                // Handle login action
                print("Login action")
            }) {
                AppButton(title: "Done", isWhite: false)
            }
            .padding(.bottom, 20)
            
            // Sign Up Text
            HStack {
                Text("Do not have an Account?")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Handle sign up navigation
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
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

