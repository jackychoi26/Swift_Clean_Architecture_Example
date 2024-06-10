//
//  MakeTransactionTests.swift
//  Swift-Clean-ArchitectureUITests
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import XCTest
@testable import Swift_Clean_Architecture

class MakeTransactionTests: XCTestCase {

    var sut: MakeTransaction!

    func test_DoesNotThrowError_When_TransferSucceeds() async throws {
       // Arrange
        let mockAccountBalanceRepository = MockAccountBalanceRepository()
        mockAccountBalanceRepository.stubbedGetBalanceExecutedResult = 100

        let mockTransactionRepository = MockTransactionRepository()

        sut = .init(
            transactionRepository: mockTransactionRepository,
            accountBalanceRepository: mockAccountBalanceRepository,
            sourceAccount: .init(id: "abcd"),
            destinationAccount: .init(id: "efgh"),
            transferAmount: 10
        )

        // Act
        _ = try await sut.execute()

        // Assert
        XCTAssertTrue(mockAccountBalanceRepository.invokedGetBalance)
        XCTAssertEqual(mockAccountBalanceRepository.invokedUpdateBalanceCount, 2)

        XCTAssertEqual(
            mockAccountBalanceRepository.invokedUpdateBalanceParametersList.first?.account,
            Account(id: "abcd")
        )

        XCTAssertEqual(
            mockAccountBalanceRepository.invokedUpdateBalanceParametersList.first?.amount,
            -10
        )

        XCTAssertEqual(
            mockAccountBalanceRepository.invokedUpdateBalanceParametersList[1].account,
            Account(id: "efgh")
        )

        XCTAssertEqual(
            mockAccountBalanceRepository.invokedUpdateBalanceParametersList[1].amount,
            10
        )

        XCTAssertTrue(mockTransactionRepository.invokedRecordTransaction)
    }
}
