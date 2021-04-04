import SwiftUI

extension Binding {
    public init(storedValue: Value) {
        var innerValue = storedValue
        self.init { innerValue }
             set: { innerValue = $0 }
    }
}
