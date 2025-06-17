import Orion
import UIKit

struct InstgramDestinationGroup: HookGroup { }

class SPTSharingSDKHook: ClassHook<NSObject> {
    typealias Group = InstgramDestinationGroup
    static let targetName = "SPTSharingSDK"
    
    func canHandleShareDestination(_ destination: SPTSharingSDKDestination) -> Bool {
        if destination.destinationID().contains("instagram") {
            return true
        }
        
        return orig.canHandleShareDestination(destination)
    }
}

class FoundationImplPropertiesHook: ClassHook<NSObject> {
    typealias Group = InstgramDestinationGroup
    static let targetName = "SPTShare_FoundationImplProperties"
    
    func isInstagramStoriesCanvasSharingEnabled() -> Bool { return true }
    func isInstagramDirectMessageSharingEnabled() -> Bool { return true }
}
