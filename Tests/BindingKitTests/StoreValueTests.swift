import BindingKit
import SwiftUI
import Testing

@Suite("Store value tests")
struct StoreValueTests {
    @Test("Stored value")
    func storedValue() {
        let binding = Binding(storedValue: 1)
        binding.wrappedValue += 1
        #expect(binding.wrappedValue == 2)
    }
}
