import SwiftUI

extension Binding {
    static func ?? <T>(lhs: Self, rhs: Value) -> Binding<Value> where Value == T? {
        Binding {
            lhs.wrappedValue ?? rhs
        } set: { newValue in
            lhs.wrappedValue = newValue
        }
    }

    static func ?? <T>(lhs: Self, rhs: T) -> Binding<T> where Value == T? {
        Binding<T> {
            lhs.wrappedValue ?? rhs
        } set: { newValue in
            lhs.wrappedValue = newValue
        }
    }
}
