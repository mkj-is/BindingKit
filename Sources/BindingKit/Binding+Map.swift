import SwiftUI

extension Binding {
    /// Maps to a new binding using two back and forth transformation closures.
    /// - Parameters:
    ///   - forth: Closure which transforms the wrapped value forth when retrieved from the returned binding.
    ///   - back: Closure which transforms the wrapped value back when set to the returned binding.
    /// - Returns: A new binding where the wrapped value is transformed using provided closures.
    public func map<T>(forth: @escaping (Value) -> T, back: @escaping (T) -> Value) -> Binding<T> {
        Binding<T>(
            get: { forth(self.wrappedValue) },
            set: { value in
                self.wrappedValue = back(value)
            }
        )
        .transaction(transaction)
    }

    /// Maps to a new binding using two-way transformation.
    /// - Parameter transformation: Two-way transformation.
    /// - Returns: A new binding where the wrapped value is transformed using the provided two-way transformation.
    public func map<T>(_ transformation: Transformation<Value, T>) -> Binding<T> {
        map(forth: transformation.forth, back: transformation.back)
    }
}
