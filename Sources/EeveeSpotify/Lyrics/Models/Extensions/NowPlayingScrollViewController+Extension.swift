import Orion

extension NowPlayingScrollViewController {
    private var nowPlayingScrollViewModel: NSObject {
        get {
            Ivars<NSObject>(self).scrollViewModel
        }
    }
    
    var scrollEnabled: Bool {
        get {
            Ivars<Bool>(nowPlayingScrollViewModel).scrollEnabled
        }
        set {
            Ivars<Bool>(nowPlayingScrollViewModel).scrollEnabled = newValue
        }
    }
    
    var loadedTrack: SPTPlayerTrack {
        get {
            Ivars<SPTPlayerTrack>(nowPlayingScrollViewModel).loadedTrack
        }
    }
    
    //
    
    private var dataSource: NSObject {
        get {
            Ivars<NSObject>(nowPlayingScrollViewModel).dataSource
        }
    }
    
    var activeProviders: Array<NSObject> {
        get {
            Ivars<Array<NSObject>>(dataSource).activeProviders
        }
        set {
            Ivars<Array<NSObject>>(dataSource).activeProviders = newValue
        }
    }
    
    //
    
    private var backgroundViewController: NSObject {
        get {
            Ivars<NSObject>(self).backgroundViewController
        }
    }
    
    var backgroundViewModel: SPTNowPlayingBackgroundViewModel {
        get {
            let ivars = Ivars<SPTNowPlayingBackgroundViewModel>(self.backgroundViewController)
            return EeveeSpotify.hookTarget == .latest
                ? ivars.artworkColorObservable
                : ivars.viewModel
        }
    }
}
