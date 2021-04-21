import SwiftUI

extension Binding {
    public static func ?? <T>(lhs: Self, rhs: Value) -> Binding<Value> where Value == T? {
        Binding {
            lhs.wrappedValue ?? rhs
        } set: { newValue in
            lhs.wrappedValue = newValue
        }
        .transaction(lhs.transaction)
    }

    public static func ?? <T>(lhs: Self, rhs: T) -> Binding<T> where Value == T? {
        Binding<T> {
            lhs.wrappedValue ?? rhs
        } set: { newValue in
            lhs.wrappedValue = newValue
        }
        .transaction(lhs.transaction)
    }
}
