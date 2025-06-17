import Foundation

struct LyricsLoadingState {
    var wasRomanized = false
    var isEmpty = false
    var fallbackError: LyricsError? = nil
    var loadedSuccessfully = false
}
