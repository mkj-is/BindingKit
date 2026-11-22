import SwiftUI
import BindingKit
import Testing

@Suite("Coalescing tests")
struct CoalescingTests {
    @Test("Basic coalescing")
    func basicCoalescing() {
        let binding = Binding<String?>.constant(nil) ?? "fallback"
        #expect(binding.wrappedValue == "fallback")
    }

    @Test("Coalescing with value")
    func coalescingWithValue() {
        let binding = Binding<String?>.constant("value") ?? "fallback"
        #expect(binding.wrappedValue == "value")
    }

    @Test("Non-optional coalescing with nil")
    func nonOptionalCoalescingWithNil() {
        let binding: Binding<String> = .constant(nil) ?? "fallback"
        #expect(binding.wrappedValue == "fallback")
    }

    @Test("Non-optional coalescing with value")
    func nonOptionalCoalescingWithValue() {
        let binding: Binding<String> = .constant("value") ?? "fallback"
        #expect(binding.wrappedValue == "value")
    }

    @Test("Coalescing sets a new value")
    func coalescingSetNewValue() {
        let source = Binding<String?>(storedValue: nil)
        let binding: Binding<String> = source ?? "fallback"
        binding.wrappedValue = "newValue"
        #expect(source.wrappedValue == "newValue")
        #expect(binding.wrappedValue == "newValue")
    }

    @Test("Coalescing sets nil")
    func coalescingSetNewNilValue() {
        let source = Binding<String?>(storedValue: "value")
        let binding: Binding<String?> = source ?? "fallback"
        binding.wrappedValue = nil
        #expect(source.wrappedValue == nil)
        #expect(binding.wrappedValue == "fallback")
    }

    @Test("Optional coalescing with nil")
    func optionalCoalescingWithNil() {
        let binding = Binding<String?>.constant(nil) ?? nil
        #expect(binding.wrappedValue == nil)
    }

    @Test("Optional coalescing with value")
    func optionalCoalescingWithValue() {
        let binding: Binding<String?> = .constant(nil) ?? "value"
        #expect(binding.wrappedValue == "value")
    }

    @Test("Optional coalescing with constant value")
    func optionalCoalescingWithConstantValue() {
        let binding: Binding<String?> = .constant("value") ?? nil
        #expect(binding.wrappedValue == "value")
    }

    @Test("Coalescing chain")
    func coalescingChain() {
        let binding = Binding<String?>.constant(nil) ?? nil ?? "fallback"
        #expect(binding.wrappedValue == "fallback")
    }
}
