//
//  postsView.swift
//  olofoofo-ios
//
//  Created by Macbook on 11/02/2025.
//

import SwiftUI

struct postsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView{
            Text("posts")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("logo")
                            .renderingMode(.template)
                               .resizable()
                               .scaledToFit()
                               .foregroundColor(colorScheme == .dark ? .white : .black)
                               .frame(height: 40)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    postsView()
}
