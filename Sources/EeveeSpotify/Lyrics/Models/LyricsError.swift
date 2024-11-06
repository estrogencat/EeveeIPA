import Foundation

enum LyricsError: Error, CustomStringConvertible {
    case noCurrentTrack
    case musixmatchRestricted
    case invalidMusixmatchToken
    case decodingError
    case noSuchSong
    case unknownError
    case invalidSource
    
    var description: String {
        switch self {
        case .noSuchSong: "no_such_song".localized
        case .musixmatchRestricted: "musixmatch_restricted".localized
        case .invalidMusixmatchToken: "invalid_musixmatch_token".localized
        case .decodingError: "decoding_error".localized
        case .noCurrentTrack: "no_current_track".localized
        case .unknownError: "unknown_error".localized
        case .invalidSource: ""
        }
    }
}
