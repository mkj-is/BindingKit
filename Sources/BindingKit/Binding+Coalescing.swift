import SwiftUI

extension Binding {
    /// Coalesces nil value with value from the right-side of the operator.
    /// - Parameters:
    ///   - lhs: Binding with optional value.
    ///   - rhs: Value returned when the binding has nil wrapped value.
    /// - Returns: Binding with the same type returning value from right side of the operator.
    ///   The type of the values is the same and remains optional.
    public static func ?? <T>(lhs: Self, rhs: Value) -> Binding<Value> where Value == T? {
        Binding {
            lhs.wrappedValue ?? rhs
        } set: { newValue in
            lhs.wrappedValue = newValue
        }
        .transaction(lhs.transaction)
    }

    /// Coalesces nil value with value from the right-side of the operator.
    /// - Parameters:
    ///   - lhs: Binding with optional value.
    ///   - rhs: Value returned when the binding has nil wrapped value.
    /// - Returns: Binding with unwrapped value returning value from right side of the operator
    ///   instead of nil values.
    public static func ?? <T>(lhs: Self, rhs: T) -> Binding<T> where Value == T? {
        Binding<T> {
            lhs.wrappedValue ?? rhs
        } set: { newValue in
            lhs.wrappedValue = newValue
        }
        .transaction(lhs.transaction)
    }
}
