//
//  Account.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import Foundation

struct Account {

    let id: String
}

extension Account: Equatable {

    static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.id == rhs.id
    }
}
