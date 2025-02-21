//
//  ProfileImageView.swift
//  olofoofo-ios
//
//  Created by Macbook on 19/02/2025.
//

import SwiftUI

struct ProfileImageView: View {
    let imageUrl:String?
    let size:CGFloat
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        AsyncImage(url: URL(string: imageUrl ?? "")){phase in
            if let image = phase.image{
                image
                .resizable()
                .scaledToFill() // Ensures it fills the whole space
                .frame(width: size, height: size)
                .clipShape(Circle()) // Clips it to a circle
            } else if phase.error != nil {
                Image(systemName: "person.crop.circle.fill") // Fallback for error
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .clipShape(Circle()) // Keeps it circular
                    .foregroundColor(.gray)
            }else{
                ProgressView()
            }
        }
        .frame(width: size,height: size)
        .clipShape(Circle())
        .shadow(radius: 3)
    }
}

#Preview {
    ProfileImageView(imageUrl: "https://res.cloudinary.com/dnuouhscg/image/upload/v1733399802/qjms8dbsih6bwxllwhxw.jpg", size: 100)
}
