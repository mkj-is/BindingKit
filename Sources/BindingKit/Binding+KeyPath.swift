import SwiftUI

extension Binding {
    /// Initializes a binding from a reference type and a key path referring to one of its properties.
    /// - Parameters:
    ///   - root: A reference type which has a writable key path.
    ///   - keyPath: A writable key path referencing one of the root type properties.
    public init<Root>(_ root: Root, keyPath: ReferenceWritableKeyPath<Root, Value>) {
        self.init {
            root[keyPath: keyPath]
        } set: { newValue in
            root[keyPath: keyPath] = newValue
        }
    }
}
