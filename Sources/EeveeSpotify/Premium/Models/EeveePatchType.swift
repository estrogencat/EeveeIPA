import Foundation

enum EeveePatchType: Int {
    case notSet
    case disabled
    case requests
    
    var isPatching: Bool { self == .requests }
}
