import SwiftUI

struct AppButton: View {
    let title: LocalizedStringKey
    let isWhite: Bool // Boolean property to control the button style
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity,
                   maxHeight: 50) // Use maxWidth to make it take the full width
            .foregroundColor(isWhite ? .primary : .white) // Change text color based on isWhite
            .background(isWhite ? Color.white : Color.primary) // Change background color based on isWhite
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isWhite ? Color.primary : Color.clear, lineWidth: 2) // Thin border in primary color if isWhite is true
            )
            .padding(.horizontal, 20) // Add 20 points of padding on both sides
    }
}

#Preview {
    AppButton(title: "Done", isWhite: false) // Test with different configurations
}
