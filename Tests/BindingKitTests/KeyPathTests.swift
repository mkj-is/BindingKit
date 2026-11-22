import SwiftUI
import BindingKit
import Testing

private final class ReferenceMock {
    var property: String = "defaultValue"
}

@Suite("Key path tests")
struct KeyPathTests {
    @Test("Key path initialization")
    func keyPathInit() {
        let reference = ReferenceMock()
        let binding = Binding(reference, keyPath: \.property)
        #expect(binding.wrappedValue == "defaultValue")
    }

    @Test("Key path setter")
    func keyPathSet() {
        let reference = ReferenceMock()
        let binding = Binding(reference, keyPath: \.property)
        binding.wrappedValue = "newValue"
        #expect(binding.wrappedValue == "newValue")
        #expect(reference.property == "newValue")
    }
}
