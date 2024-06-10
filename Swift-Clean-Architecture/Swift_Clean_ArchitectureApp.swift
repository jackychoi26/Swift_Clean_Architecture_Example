//
//  Swift_Clean_ArchitectureApp.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import SwiftUI

@main
struct Swift_Clean_ArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionView(viewModel: .init())
        }
    }
}
