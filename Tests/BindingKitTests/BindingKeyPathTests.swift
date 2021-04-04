import SwiftUI
import BindingKit
import XCTest

private final class ReferenceMock {
    var property: String = "defaultValue"
}

final class BindingKeyPathTests: XCTestCase {
    func testsKeyPathInit() {
        let reference = ReferenceMock()
        let binding = Binding(reference, keyPath: \.property)
        XCTAssertEqual(binding.wrappedValue, "defaultValue")
    }
    
    func testsKeyPathSet() {
        let reference = ReferenceMock()
        let binding = Binding(reference, keyPath: \.property)
        binding.wrappedValue = "newValue"
        XCTAssertEqual(binding.wrappedValue, "newValue")
        XCTAssertEqual(reference.property, "newValue")
    }
}
