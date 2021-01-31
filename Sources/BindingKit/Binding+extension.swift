import SwiftUI

public extension Binding {
    func map<T>(forth: @escaping (Value) -> T, back: @escaping (T) -> Value) -> Binding<T> {
        Binding<T>(
            get: { forth(self.wrappedValue) },
            set: { value in
                self.wrappedValue = back(value)
            }
        )
    }

    func map<T>(_ transformation: Transformation<Value, T>) -> Binding<T> {
        map(forth: transformation.forth, back: transformation.back)
    }

    init<Root>(_ root: Root, keyPath: ReferenceWritableKeyPath<Root, Value>) {
        self.init {
            root[keyPath: keyPath]
        } set: { newValue in
            root[keyPath: keyPath] = newValue
        }
    }

    func didSet(effect: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                effect(newValue)
            }
        )
    }

    func willSet(effect: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                effect(newValue)
                self.wrappedValue = newValue
            }
        )
    }
}

