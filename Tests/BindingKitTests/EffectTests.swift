import XCTest
import SwiftUI
import BindingKit

final class EffectTests: XCTestCase {
    func testWillSet() {
        var innerValue = "firstValue"
        let binding = Binding { innerValue } set: { innerValue = $0 }

        let expectation = self.expectation(description: "Will set called")
        let bindingWithEffect = binding.willSet { newValue in
            XCTAssertEqual(binding.wrappedValue, "firstValue")
            XCTAssertEqual(newValue, "secondValue")
            expectation.fulfill()
        }
        bindingWithEffect.wrappedValue = "secondValue"
        wait(for: [expectation], timeout: 0)
    }

    func testDidSet() {
        var innerValue = "firstValue"
        let binding = Binding { innerValue } set: { innerValue = $0 }

        let expectation = self.expectation(description: "Will set called")
        let bindingWithEffect = binding.didSet { newValue in
            XCTAssertEqual(binding.wrappedValue, "secondValue")
            XCTAssertEqual(newValue, "secondValue")
            expectation.fulfill()
        }
        bindingWithEffect.wrappedValue = "secondValue"
        wait(for: [expectation], timeout: 0)
    }
}
