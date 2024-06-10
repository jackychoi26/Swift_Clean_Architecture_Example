//
//  TransactionViewModel.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

struct TransactionViewModel {

    private let makeTransaction: MakeTransaction

    init(
        makeTransaction: MakeTransaction = .init(
            transactionRepository: TransactionRepositoryImpl(),
            accountBalanceRepository: AccountBalanceRepositoryImpl(),
            sourceAccount: Account(id: "abcd"),
            destinationAccount: Account(id: "efgh"),
            transferAmount: 10
        )
    ) {
        self.makeTransaction = makeTransaction
    }

    func didTapPrimaryButton() async throws {
        try await makeTransaction.execute()
    }
}
