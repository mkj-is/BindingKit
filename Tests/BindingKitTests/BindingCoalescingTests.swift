import XCTest
import SwiftUI
import BindingKit

final class BindingCoalescingTests: XCTestCase {
    func testBasicCoalescing() {
        let binding = Binding<String?>.constant(nil) ?? "fallback"
        XCTAssertEqual(binding.wrappedValue, "fallback")
    }
    
    func testBasicCoalescingWithValue() {
        let binding = Binding<String?>.constant("value") ?? "fallback"
        XCTAssertEqual(binding.wrappedValue, "value")
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
