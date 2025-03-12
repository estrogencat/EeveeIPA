import UIKit
import Combine

struct AnonymousTokenHelper {
    private static let apiUrl = "https://apic.musixmatch.com"
    
    static func requestAnonymousMusixmatchToken() -> AnyPublisher<String, Error> {
        let url = URL(string: "\(apiUrl)/ws/1.1/token.get?app_id=\(UIDevice.current.musixmatchAppId)")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data in
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let message = json["message"] as? [String: Any],
                      let body = message["body"] as? [String: Any],
                      let userToken = body["user_token"] as? String
                else {
                    throw AnonymousTokenError.invalidResponse
                }
                
                return userToken
            }
            .eraseToAnyPublisher()
    }
}
