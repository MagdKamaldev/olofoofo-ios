//
//  AppButton.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import SwiftUI

struct AppButton: View {
    let title: LocalizedStringKey
    let isWhite: Bool // Add a new boolean property to control the button style
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(isWhite ? .primary : .white) // Change text color based on isWhite
            .background(isWhite ? Color.white : Color.primary) // Change background color based on isWhite
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isWhite ? Color.primary : Color.clear, lineWidth: 2) // Thin border in primary color if isWhite is true
            )
    }
}

#Preview {
    AppButton(title: "title", isWhite: false) // You can test with isWhite: true or false
}
