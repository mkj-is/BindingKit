import XCTest
import BindingKit
import SwiftUI

final class BindingStoreValueTests: XCTestCase {
    func testStoredValue() {
        let binding = Binding(storedValue: 1)
        binding.wrappedValue += 1
        XCTAssertEqual(binding.wrappedValue, 2)
    }
}
