//
//  Transaction.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

struct Transaction {

    let amount: Double
    let date: Date
    let fromAccount: Account
    let toAccount: Account
}
