import UIKit

extension UIDevice {
    var isIpad: Bool {
        self.userInterfaceIdiom == .pad
    }
    
    var musixmatchAppId: String {
        UIDevice.current.isIpad
            ? "mac-ios-ipad-v1.0"
            : "mac-ios-v2.0"
    }
}
