import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            postsView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
            
            AddPostView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Add Post")
                }
            
            MessegesView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
        }
        .accentColor(.primary)
    }
}

#Preview {
    HomeTabView()
}
