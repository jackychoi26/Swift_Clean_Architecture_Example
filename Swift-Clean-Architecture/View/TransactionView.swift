//
//  TransactionView.swift
//  Swift-Clean-Architecture
//
//  Created by Choi Kin Lung on 10/6/2024.
//

import SwiftUI

struct TransactionView: View {

    let viewModel: TransactionViewModel

    init(viewModel: TransactionViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    Task {
                        try? await viewModel.didTapPrimaryButton()
                    }
                }) {
                    Text("Make transaction")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}
