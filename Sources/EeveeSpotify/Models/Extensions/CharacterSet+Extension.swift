import Foundation

extension CharacterSet {
    static var urlQueryAllowedStrict: CharacterSet {
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "/?@&=+$")
        return allowed
    }
}