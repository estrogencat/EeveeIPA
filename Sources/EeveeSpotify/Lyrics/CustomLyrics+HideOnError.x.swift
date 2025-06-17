import Orion
import UIKit

class ErrorViewControllerHook: ClassHook<UIViewController> {
    typealias Group = LyricsGroup
    
    static var targetName: String {
        switch EeveeSpotify.hookTarget {
        case .lastAvailableiOS14: return "Lyrics_CoreImpl.ErrorViewController"
        default: return "Lyrics_NPVCommunicatorImpl.ErrorViewController"
        }
    }
    
    func loadView() {
        orig.loadView()
        
        guard UserDefaults.lyricsOptions.hideOnError, let controller = nowPlayingScrollViewController else {
            return
        }
        
        var providers = controller.activeProviders
        
        providers.removeAll(
            where: { NSStringFromClass(type(of: $0)) == HookTargetNameHelper.lyricsScrollProvider }
        )
        
        controller.activeProviders = providers
        controller.collectionView().reloadData()
    }
}
