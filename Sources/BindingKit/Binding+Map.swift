import SwiftUI

extension Binding {
    public func map<T>(forth: @escaping (Value) -> T, back: @escaping (T) -> Value) -> Binding<T> {
        Binding<T>(
            get: { forth(self.wrappedValue) },
            set: { value in
                self.wrappedValue = back(value)
            }
        )
        .transaction(transaction)
    }

    public func map<T>(_ transformation: Transformation<Value, T>) -> Binding<T> {
        map(forth: transformation.forth, back: transformation.back)
    }
}
