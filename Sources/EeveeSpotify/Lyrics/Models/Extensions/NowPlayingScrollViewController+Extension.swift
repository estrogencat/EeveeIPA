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
    
    var backgroundViewController: SPTNowPlayingBackgroundViewController {
        get {
            Ivars<SPTNowPlayingBackgroundViewController>(self).backgroundViewController
        }
    }
}
