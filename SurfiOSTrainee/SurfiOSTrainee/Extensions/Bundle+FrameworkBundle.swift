import Foundation

private class ClassForBundle {}

extension Bundle {
    static var frameworkBundle: Self {
        .init(for: ClassForBundle.self)
    }
}
