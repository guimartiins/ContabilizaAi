//
//  TransactionList.swift
//  ContabilizaAi
//
//  Created by Guilherme Alves on 18/03/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(transactionListViewModel.groupTransactionByMonth()), id: \.key) {
                    month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                                TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transações")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListViewModel: TransactionListViewModel = {
        let transactionListViewModel = TransactionListViewModel()
        transactionListViewModel.transactions = transactionListPreviewData
        return transactionListViewModel
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
                   
            }
        }
        .environmentObject(transactionListViewModel)
    }
}
