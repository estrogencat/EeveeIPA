import Foundation
import UIKit

@objc protocol NowPlayingScrollViewController {
    func collectionView() -> UICollectionView
    func nowPlayingScrollViewModelDidChangeScrollEnabledValue()
}
