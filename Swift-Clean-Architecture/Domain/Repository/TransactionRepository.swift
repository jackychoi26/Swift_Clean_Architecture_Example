//
//  TransactionRepository.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

protocol TransactionRepository {
    func recordTransaction(_ transaction: Transaction) async throws
}
