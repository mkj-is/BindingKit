import SwiftUI

extension Binding {
    /// Modifies the transaction associated with the binding.
    /// - Parameter transform: Closure to mutate the transaction.
    /// - Returns: Binding of the same type with the modified transaction.
    ///
    /// Example:
    /// ```swift
    /// // Using with a custom TransactionKey (e.g. to flag sort operations)
    /// sortDescriptorsBinding.transaction { $0.isSorting = true }
    /// ```
    public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> Self {
        var tx = self.transaction
        transform(&tx)
        return self.transaction(tx)
    }
    
    /// Modifies a specific property of the transaction associated with the binding.
    /// - Parameters:
    ///   - keyPath: A writable key path to the transaction property.
    ///   - value: The new value to assign to the transaction property.
    /// - Returns: Binding of the same type with the modified transaction.
    ///
    /// Example:
    /// ```swift
    /// // Animate for inserts/moves/deletes but not for sort changes.
    /// Table(items, sortOrder: $sortDescriptors.transaction(\.disablesAnimations, true)) {
    ///      ...
    /// }
    /// .animation(.default, value: items.map(\.id))
    /// ```
    public func transaction<V>(_ keyPath: WritableKeyPath<Transaction, V>, _ value: V) -> Self {
        transaction { transaction in
            transaction[keyPath: keyPath] = value
        }
    }
}
