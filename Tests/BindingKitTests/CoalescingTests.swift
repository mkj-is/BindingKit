import XCTest
import SwiftUI
import BindingKit

final class CoalescingTests: XCTestCase {
    func testBasicCoalescing() {
        let binding = Binding<String?>.constant(nil) ?? "fallback"
        XCTAssertEqual(binding.wrappedValue, "fallback")
    }
    
    func testCoalescingWithValue() {
        let binding = Binding<String?>.constant("value") ?? "fallback"
        XCTAssertEqual(binding.wrappedValue, "value")
    }
    
    func testCoalescingSetNewValue() {
        let binding = Binding<String?>(storedValue: nil) ?? "fallback"
        binding.wrappedValue = "newValue"
        XCTAssertEqual(binding.wrappedValue, "newValue")
    }
    
    func testCoalescingSetNewNilValue() {
        let binding: Binding<String?> = .init(storedValue: "value") ?? "fallback"
        binding.wrappedValue = nil
        XCTAssertEqual(binding.wrappedValue, "fallback")
    }
    
    func testOptionalCoalescingWithNil() {
        let binding = Binding<String?>.constant(nil) ?? nil
        XCTAssertEqual(binding.wrappedValue, nil)
    }
    
    func testOptionalCoalescingWithValue() {
        let binding: Binding<String?> = .constant(nil) ?? "value"
        XCTAssertEqual(binding.wrappedValue, "value")
    }
    
    func testOptionalCoalescingWithConstantValue() {
        let binding: Binding<String?> = .constant("value") ?? nil
        XCTAssertEqual(binding.wrappedValue, "value")
    }
    
    func testCoalescingChain() {
        let binding = Binding<String?>.constant(nil) ?? nil ?? "fallback"
        XCTAssertEqual(binding.wrappedValue, "fallback")
    }
}
