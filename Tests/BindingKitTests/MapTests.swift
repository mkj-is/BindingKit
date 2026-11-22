import SwiftUI
import BindingKit
import Testing

@Suite("Map tests")
struct MapTests {
    @Test("Back-and-forth map get")
    func backAndForthMapGet() {
        let binding = Binding<Int>(storedValue: 1)
        let mapped = binding.map(forth: String.init, back: { Int($0) ?? 0 })
        #expect(mapped.wrappedValue == "1")
    }

    @Test("Back-and-forth map set")
    func backAndForthMapSet() {
        let binding = Binding<Int>(storedValue: 1)
        let mapped = binding.map(forth: String.init, back: { Int($0) ?? 0 })
        mapped.wrappedValue = "2"
        #expect(binding.wrappedValue == 2)
        #expect(mapped.wrappedValue == "2")
    }

    @Test("Transformation")
    func transformation() {
        let transformation = Transformation<Int, String>(
            forth: String.init,
            back: { Int($0) ?? 0 }
        )
        let binding = Binding<Int>(storedValue: 1)
        let mapped = binding.map(transformation)
        mapped.wrappedValue = "2"
        #expect(binding.wrappedValue == 2)
        #expect(mapped.wrappedValue == "2")
    }
}
