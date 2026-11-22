import SwiftUI
import BindingKit
import Testing

@Suite("Transaction tests")
struct TransactionTests {
    @Test("Transaction closure modifies transaction")
    func transactionClosureModifiesTransaction() {
        var sourceValue = "value"
        let binding = Binding(
            get: { sourceValue },
            set: { sourceValue = $0 }
        )

        let transformed = binding.transaction { transaction in
            transaction.disablesAnimations = true
        }

        #expect(transformed.transaction.disablesAnimations)
        #expect(transformed.wrappedValue == "value")

        transformed.wrappedValue = "updated"
        #expect(sourceValue == "updated")
    }

    @Test("Transaction closure preserves existing transaction changes")
    func transactionClosurePreservesExistingTransactionChanges() {
        let binding = Binding<String>.constant("value")
            .transaction { transaction in
                transaction.disablesAnimations = true
            }

        let transformed = binding.transaction { transaction in
            transaction.isContinuous = true
        }

        #expect(transformed.transaction.disablesAnimations)
        #expect(transformed.transaction.isContinuous)
    }

    @Test("Transaction key path modifies transaction")
    func transactionKeyPathModifiesTransaction() {
        let binding = Binding<String>.constant("value")
            .transaction(\.disablesAnimations, true)

        #expect(binding.transaction.disablesAnimations)
    }
}
