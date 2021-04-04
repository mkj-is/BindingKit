import XCTest
import BindingKit
import SwiftUI

final class StoreValueTests: XCTestCase {
    func testStoredValue() {
        let binding = Binding(storedValue: 1)
        binding.wrappedValue += 1
        XCTAssertEqual(binding.wrappedValue, 2)
    }
}
