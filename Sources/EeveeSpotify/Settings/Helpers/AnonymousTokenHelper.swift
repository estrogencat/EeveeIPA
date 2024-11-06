import Foundation
import UIKit

struct AnonymousTokenHelper {
    private static let apiUrl = "https://apic.musixmatch.com"
    
    static func requestAnonymousMusixmatchToken() async throws -> String {
        let url = URL(string: "\(apiUrl)/ws/1.1/token.get?app_id=\(await UIDevice.current.musixmatchAppId)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
            let message = json["message"] as? [String: Any],
            let body = message["body"] as? [String: Any],
            let userToken = body["user_token"] as? String
        else {
            throw AnonymousTokenError.invalidResponse
        }
        
        return userToken
    }
}
