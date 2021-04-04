import XCTest
import SwiftUI
import BindingKit

final class BindingMapTests: XCTestCase {
    func testBackAndForthMapGet() {
        let binding = Binding<Int>(storedValue: 1)
        let mapped = binding.map(forth: String.init, back: { Int($0) ?? 0 })
        XCTAssertEqual(mapped.wrappedValue, "1")
    }
    
    func testBackAndForthMapSet() {
        let binding = Binding<Int>(storedValue: 1)
        let mapped = binding.map(forth: String.init, back: { Int($0) ?? 0 })
        mapped.wrappedValue = "2"
        XCTAssertEqual(binding.wrappedValue, 2)
        XCTAssertEqual(mapped.wrappedValue, "2")
    }
    
    func testTransformation() {
        let transformation = Transformation<Int, String>(
            forth: String.init,
            back: { Int($0) ?? 0 }
        )
        let binding = Binding<Int>(storedValue: 1)
        let mapped = binding.map(transformation)
        mapped.wrappedValue = "2"
        XCTAssertEqual(binding.wrappedValue, 2)
        XCTAssertEqual(mapped.wrappedValue, "2")
    }
}
