import SwiftUI

extension Binding {
    /// Validates the new value using a boolean predicate closure before mutating the wrapped value.
    /// If the closure returns `false`, assignment to `wrappedValue` is skipped.
    /// - Parameter validation: A closure that inspects the proposed value and returns `true` if valid.
    /// - Returns: A new Binding that only applies changes when validation succeeds.
    public func validate(_ validation: @escaping (Value) -> Bool) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                if validation(newValue) {
                    self.wrappedValue = newValue
                }
            }
        )
        .transaction(transaction)
    }
}
