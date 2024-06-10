//
//  MockTransactionRepository.swift
//  Swift-Clean-ArchitectureUITests
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import XCTest
@testable import Swift_Clean_Architecture

class MockTransactionRepository: TransactionRepository {

    var invokedRecordTransaction = false
    var invokedRecordTransactionCount = 0
    var invokedRecordTransactionParameters: (transaction: Transaction, Void)?
    var invokedRecordTransactionParametersList = [(transaction: Transaction, Void)]()
    var throwingError: Error?

    func recordTransaction(_ transaction: Transaction) throws {
        invokedRecordTransaction = true
        invokedRecordTransactionCount += 1
        invokedRecordTransactionParameters = (transaction, ())
        invokedRecordTransactionParametersList.append((transaction, ()))

        if throwingError != nil {
            throw throwingError!
        }
    }
}
