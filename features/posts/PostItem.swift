//
//  PostItem.swift
//  olofoofo-ios
//
//  Created by Macbook on 21/02/2025.
//

import SwiftUI

struct PostItem: View {
    @Environment(\.colorScheme) var colorScheme
    let post = Post(
        id: "123456",
        content: "This is an updated test post with new details!",
        author: Author(
            id: "98765",
            firstName: "John",
            lastName: "Doe",
            profileImg: "https://pbs.twimg.com/profile_images/1416543088588230665/Pmjz4ir6_400x400.jpg"
        ),
        likesCount: 25,
        commentsCount: 5,
        media: [
            "https://pbs.twimg.com/profile_images/1416543088588230665/Pmjz4ir6_400x400.jpg",
            "https://pbs.twimg.com/profile_images/1416543088588230665/Pmjz4ir6_400x400.jpg"
        ],
        createdAt: "2025-02-20T10:00:00Z",
        updatedAt: "2025-02-20T14:00:00Z",
        isLiked: false
    )

    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                // Post Header (Author + Timestamp)
                HStack {
                    ProfileImageView(imageUrl: post.author.profileImg, size: 60)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Author Name") // Replace with actual author name if available
                            .font(.headline)
                        Text(formatDate(post.createdAt))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }

                // Post Content
                Text(post.content)
                    .font(.body)
                    .padding(.top, 5)

                // Post Media (if available)
                // Post Media (if available)
                if !post.media.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(post.media, id: \.self) { mediaUrl in
                                AsyncImage(url: URL(string: mediaUrl)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView() // Show loading indicator
                                            .frame(width: 200, height: 200)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 200)
                                            .cornerRadius(10)
                                            .clipped()
                                    case .failure:
                                        Image(systemName: "photo") // Show placeholder in case of failure
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                        }
                    }
                }

                // Post Footer (Likes & Comments)
                HStack {
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Image(post.isLiked ? "Heart":"Heart_filled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("\(post.likesCount)")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal,10)

                    Button(action: {}) {
                        HStack{
                            Image("Chat_filled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("\(post.commentsCount)")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal,20)
                    }
                }
            }
            .padding()
            .background(colorScheme == .dark ? Color(.secondarySystemBackground) : Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.horizontal, 16)
        }
        
    // Date formatting function
    private func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // Ensure UTC time parsing

        guard let date = formatter.date(from: dateString) else {
            return "Unknown Date"
        }

        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.minute, .hour, .day, .weekOfYear, .month, .year],
            from: date,
            to: now
        )

        if let years = components.year, years > 0 {
            return "\(years)y ago"
        } else if let months = components.month, months > 0 {
            return "\(months)mo ago"
        } else if let weeks = components.weekOfYear, weeks > 0 {
            return "\(weeks)w ago"
        } else if let days = components.day, days > 0 {
            return "\(days)d ago"
        } else if let hours = components.hour, hours > 0 {
            return "\(hours)h ago"
        } else if let minutes = components.minute, minutes > 0 {
            return "\(minutes)m ago"
        } else {
            return "Just now"
        }
    }

}

#Preview {
    PostItem()
}
