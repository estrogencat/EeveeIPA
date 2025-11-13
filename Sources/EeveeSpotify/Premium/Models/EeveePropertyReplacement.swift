enum EeveePropertyModification {
    case remove
    case setBool(Bool)
    case setEnum(String)
}

struct EeveePropertyReplacement {
    let scope: String?
    let name: String?
    let modification: EeveePropertyModification
    
    init(name: String? = nil, scope: String? = nil, modification: EeveePropertyModification) {
        self.name = name
        self.scope = scope
        self.modification = modification
    }
}
