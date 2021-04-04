import SwiftUI

extension Binding {
    public func didSet(effect: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                effect(newValue)
            }
        )
    }

    public func willSet(effect: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                effect(newValue)
                self.wrappedValue = newValue
            }
        )
    }
}
