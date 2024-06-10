//
//  AccountBalanceRepositoryImpl.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

// This is an abstraction of the data source dependency
// You can replace any database adaptation or api endpoint in here
struct AccountBalanceRepositoryImpl: AccountBalanceRepository {

    func getBalance(account: Account) async throws -> Double {
        // Get data from either webservice or local data source
        return 10
    }
    
    func updateBalance(account: Account, amount: Double) async throws {
        // Update balance by calling some api or local data source
        return
    }
}
