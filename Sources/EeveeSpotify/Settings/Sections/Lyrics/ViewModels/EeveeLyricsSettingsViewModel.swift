import SwiftUI
import Combine

class EeveeLyricsSettingsViewModel: ObservableObject {
    @Published var lyricsSource = UserDefaults.lyricsSource
    
    @Published var lyricsOptions = UserDefaults.lyricsOptions {
        didSet { UserDefaults.lyricsOptions = lyricsOptions }
    }
    
    @Published var musixmatchToken = UserDefaults.musixmatchToken
    @Published var isRequestingMusixmatchToken = false
    @Published var musixmatchTokenInputAlertPublisher = PassthroughSubject<Bool, Never>()
    var isMusixmatchTokenValid: Bool { getMusixmatchToken(musixmatchToken) != nil }
    
    @Published var showMusixmatchInvalidLanguageWarning = false
    @Published var lrclibURLState = LrclibURLState.default
    
    var animationValues: [AnyHashable] {
        [
            lyricsSource,
            lyricsOptions,
            isMusixmatchTokenValid,
            isRequestingMusixmatchToken,
            lrclibURLState,
            showMusixmatchInvalidLanguageWarning
        ]
    }
    
    var cancellables = Set<AnyCancellable>()

    init() {
        setupBindings()
    }
    
    func getMusixmatchTokenFromDebugInfo(_ debugInfo: String) -> String? {
        if let match = debugInfo.firstMatch("\\[UserToken\\]: ([a-f0-9]+)"),
            let tokenRange = Range(match.range(at: 1), in: debugInfo) {
            return String(debugInfo[tokenRange])
        }
        
        return nil
    }
    
    func getMusixmatchToken(_ input: String) -> String? {
        if input ~= "^[a-f0-9]{54}$" {
            return input
        }
        
        return nil
    }
    
    func requestAnonymousMusixmatchToken() {
        isRequestingMusixmatchToken = true
                
        AnonymousTokenHelper.requestAnonymousMusixmatchToken()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isRequestingMusixmatchToken = false
                
                switch completion {
                case .failure(_):
                    self?.musixmatchTokenInputAlertPublisher.send(false)
                case .finished:
                    UserDefaults.lyricsSource = .musixmatch
                    break
                }
            }, receiveValue: { [weak self] token in
                self?.musixmatchToken = token
            })
            .store(in: &cancellables)
    }
}
