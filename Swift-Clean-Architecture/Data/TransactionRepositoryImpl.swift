//
//  TransactionRepositoryImpl.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

// This is an abstraction of the data source dependency
// You can replace any database adaptation or api endpoint in here
struct TransactionRepositoryImpl: TransactionRepository {

    func recordTransaction(_ transaction: Transaction) async throws {
        // Do something or call some api endpoints here
        return
    }
}
