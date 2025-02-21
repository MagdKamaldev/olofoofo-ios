import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Loading Profile...")
                    .scaleEffect(1.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else if let user = viewModel.user {
                ScrollView{
                    VStack(alignment: .center, spacing: 40) {
                        HStack(alignment: .center, spacing: 20) {
                            ProfileImageView(imageUrl: user.profileImg, size: 80)
                            VStack(alignment: .leading, spacing: 4) {
                                Spacer().frame(height: 20)
                                Text("\(user.firstName) \(user.lastName)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text(user.email)
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)
                        
                        Text(user.bio ?? "No bio.")
                            .padding(.horizontal, 20)
                        
                        Button(action: {
                            // Edit Profile Action
                        }) {
                            AppButton(title: "Edit Profile", isWhite: false)
                        }
                        
                        // Posts & Friends Section
                        HStack {
                            VStack {
                                Text("\(user.posts.count)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Posts")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .frame(width: 2, height: 60)
                                .foregroundColor(.gray)
                            
                            VStack {
                                Text("\(user.friends.count)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Friends")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 40)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("My Profile")
        .onAppear {
            viewModel.fetchProfile()
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

