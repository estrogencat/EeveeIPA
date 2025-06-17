import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    var container: UserDefaults = .standard

    var wrappedValue: T {
        get {
            if let data = container.data(forKey: key),
               let value = try? JSONDecoder().decode(T.self, from: data) {
                return value
            }
            return defaultValue
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                container.set(data, forKey: key)
            }
        }
    }
}
