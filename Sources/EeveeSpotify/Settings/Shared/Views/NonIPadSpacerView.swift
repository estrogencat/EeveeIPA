import SwiftUI

struct NonIPadSpacerView: View {
    var body: some View {
        if !UIDevice.current.isIpad {
            Spacer()
                .frame(height: 40)
                .listRowBackground(Color.clear)
                .modifier(ListRowSeparatorHidden())
        }
    }
}
