import SwiftUI

extension Binding {
    /// Initializes a binding which stores the provided value.
    /// - Parameter storedValue: Value which will be stored and referenced in the Binding get and set closures.
    public init(storedValue: Value) {
        var innerValue = storedValue
        self.init { innerValue }
             set: { innerValue = $0 }
    }
}
