//
//  MockAccountBalanceRepository.swift
//  Swift-Clean-ArchitectureUITests
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import XCTest
@testable import Swift_Clean_Architecture

class MockAccountBalanceRepository: AccountBalanceRepository {

    var invokedGetBalance = false
    var invokedGetBalanceCount = 0
    var invokedGetBalanceParameters: (account: Account, Void)?
    var invokedGetBalanceParametersList = [(account: Account, Void)]()
    var stubbedGetBalanceExecutedResult: Double!
    var getBalanceThrowingError: Error?

    func getBalance(account: Account) throws -> Double {
        invokedGetBalance = true
        invokedGetBalanceCount += 1
        invokedGetBalanceParameters = (account, ())
        invokedGetBalanceParametersList.append((account, ()))

        if getBalanceThrowingError != nil {
            throw getBalanceThrowingError!
        }

        return stubbedGetBalanceExecutedResult
    }

    var invokedUpdateBalance = false
    var invokedUpdateBalanceCount = 0
    var invokedUpdateBalanceParameters: (account: Account, amount: Double)?
    var invokedUpdateBalanceParametersList = [(account: Account, amount: Double)]()
    var updateBalanceThrowingError: Error?

    func updateBalance(account: Account, amount: Double) throws {
        invokedUpdateBalance = true
        invokedUpdateBalanceCount += 1
        invokedUpdateBalanceParameters = (account, amount)
        invokedUpdateBalanceParametersList.append((account, amount))

        if updateBalanceThrowingError != nil {
            throw updateBalanceThrowingError!
        }
    }
}
