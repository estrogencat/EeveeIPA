import SwiftUI

struct DynamicIconModifier: ViewModifier {
    var systemName: String
    var color: Color
    @Binding var condition: Bool
    
    func body(content: Content) -> some View {
        HStack {
            if condition {
                Image(systemName: systemName)
                    .font(.title2)
                    .foregroundColor(color)
            }
            
            content
        }
    }
}

extension View {
    func icon(_ systemName: String, color: Color, when condition: Binding<Bool>) -> some View {
        modifier(DynamicIconModifier(systemName: systemName, color: color, condition: condition))
    }
}
