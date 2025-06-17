import Orion
import UIKit

var nowPlayingScrollViewController: NowPlayingScrollViewController?

class NowPlayingScrollViewControllerInstanceHook: ClassHook<UIViewController> {
    typealias Group = LyricsGroup
    static let targetName = "NowPlaying_ScrollImpl.NowPlayingScrollViewController"
    
    func nowPlayingScrollViewModelWithDidMoveToRelativeTrack(
        _ track: SPTPlayerTrack,
        withDifferentProviders: Bool,
        scrollEnabledValueChanged: Bool
    ) -> NowPlayingScrollViewController {
        nowPlayingScrollViewController = orig.nowPlayingScrollViewModelWithDidMoveToRelativeTrack(
            track,
            withDifferentProviders: withDifferentProviders,
            scrollEnabledValueChanged: scrollEnabledValueChanged
        )
        
        return nowPlayingScrollViewController!
    }
}
