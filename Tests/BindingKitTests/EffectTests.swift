import SwiftUI
import BindingKit
import Testing

@Suite("Effect tests")
struct EffectTests {
    @Test("Will-set effect")
    func willSet() {
        var innerValue = "firstValue"
        let binding = Binding { innerValue } set: { innerValue = $0 }

        let bindingWithEffect = binding.willSet { newValue in
            #expect(binding.wrappedValue == "firstValue")
            #expect(newValue == "secondValue")
        }
        bindingWithEffect.wrappedValue = "secondValue"
    }

    @Test("Did-set effect")
    func didSet() {
        var innerValue = "firstValue"
        let binding = Binding { innerValue } set: { innerValue = $0 }

        let bindingWithEffect = binding.didSet { newValue in
            #expect(binding.wrappedValue == "secondValue")
            #expect(newValue == "secondValue")
        }
        bindingWithEffect.wrappedValue = "secondValue"
    }
}
