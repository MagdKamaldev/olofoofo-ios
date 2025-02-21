import SwiftUI

struct AppButton: View {
    let title: LocalizedStringKey
    let isWhite: Bool
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: 50) // Ensures a minimum height of 50
            .foregroundColor(isWhite ? .primary : .white)
            .background(isWhite ? Color.white : Color.primary)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isWhite ? Color.primary : Color.clear, lineWidth: 2)
            )
            .padding(.horizontal, 20)
    }
}

#Preview {
    AppButton(title: "Done", isWhite: false) // Test with different configurations
}
