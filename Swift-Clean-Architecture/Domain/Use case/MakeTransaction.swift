//
//  MakeTransaction.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

struct MakeTransaction {

    private let transactionRepository: TransactionRepository
    private let accountBalanceRepository: AccountBalanceRepository
    private let sourceAccount: Account
    private let destinationAccount: Account
    private let transferAmount: Double

    init(
        transactionRepository: TransactionRepository,
        accountBalanceRepository: AccountBalanceRepository,
        sourceAccount: Account,
        destinationAccount: Account,
        transferAmount: Double
    ) {
        self.transactionRepository = transactionRepository
        self.accountBalanceRepository = accountBalanceRepository
        self.sourceAccount = sourceAccount
        self.destinationAccount = destinationAccount
        self.transferAmount = transferAmount
    }

    func execute() async throws {
        let sourceBalance = try await accountBalanceRepository.getBalance(account: sourceAccount)

        // Check if the source account has enough balance
        guard sourceBalance >= transferAmount else {
            throw InsufficientFundsError()
        }

        // Update balances in the account balance repository
        try await accountBalanceRepository.updateBalance(account: sourceAccount, amount: -transferAmount)
        try await accountBalanceRepository.updateBalance(account: destinationAccount, amount: transferAmount)

        // Create and record the transaction
        let transaction = Transaction(
            amount: transferAmount,
            date: Date(),
            fromAccount: sourceAccount,
            toAccount: destinationAccount
        )

        try await transactionRepository.recordTransaction(transaction)
    }
}
