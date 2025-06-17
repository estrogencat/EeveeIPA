import Foundation

extension Dictionary {
    var queryString: String {
        return self
            .compactMap({ (key, value) -> String? in
                guard let keyString = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowedStrict),
                      let valueString = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowedStrict) else {
                    return nil
                }
                return "\(keyString)=\(valueString)"
            })
            .joined(separator: "&")
    }
}