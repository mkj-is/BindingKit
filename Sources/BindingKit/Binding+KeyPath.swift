import SwiftUI

extension Binding {
    public init<Root>(_ root: Root, keyPath: ReferenceWritableKeyPath<Root, Value>) {
        self.init {
            root[keyPath: keyPath]
        } set: { newValue in
            root[keyPath: keyPath] = newValue
        }
    }
}
