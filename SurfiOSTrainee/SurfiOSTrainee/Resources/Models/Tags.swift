enum Tags: CaseIterable {
    case ios
    case android
    case design
    case flutter
    case QA
    case PM
    
    var title: String {
        switch self {
        case .ios:
            return .ios
            
        case .android:
            return .android
            
        case .design:
            return .design
            
        case .flutter:
            return .flutter
            
        case .QA:
            return .QA
            
        case .PM:
            return .PM
        }
    }
    
    static var allTags: [String] {
      return Tags.allCases.map { $0.title }
    }
}
