import SwiftUI

extension Binding {
    /// Executes side-effect every time after a new value is set to the wrapped value of the binding.
    /// - Parameter effect: Function called every time after a new value is set to the binding.
    /// - Returns: Binding of the same type with the same wrapped value.
    public func didSet(effect: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                effect(newValue)
            }
        )
        .transaction(transaction)
    }

    /// Executes side-effect every time before a new value is set to the wrapped value of the binding.
    /// - Parameter effect: Function called every time before a new value is set to the binding.
    /// - Returns: Binding of the same type with the same wrapped value.
    public func willSet(effect: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                effect(newValue)
                self.wrappedValue = newValue
            }
        )
        .transaction(transaction)
    }
}
