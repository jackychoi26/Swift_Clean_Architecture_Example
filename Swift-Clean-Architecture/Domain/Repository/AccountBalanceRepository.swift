//
//  AccountBalanceRepository.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

protocol AccountBalanceRepository {
    func getBalance(account: Account) async throws -> Double
    func updateBalance(account: Account, amount: Double) async throws
}
