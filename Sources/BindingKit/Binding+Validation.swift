import SwiftUI

extension Binding {
    /// Validates the new value using a throwing closure before mutating the wrapped value.
    /// If the closure throws, assignment to `wrappedValue` is skipped.
    /// - Parameter validation: A throwing closure that inspects the proposed value.
    /// - Returns: A new Binding that only applies changes when validation succeeds.
    public func validate(_ validation: @escaping (Value) throws -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                do {
                    try validation(newValue)
                    self.wrappedValue = newValue
                } catch {
                    // Throwing halts assignment; wrappedValue remains untouched
                }
            }
        )
        .transaction(transaction)
    }
}
