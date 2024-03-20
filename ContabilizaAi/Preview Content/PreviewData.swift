//
//  PreviewData.swift
//  ContabilizaAi
//
//  Created by Guilherme Alves on 18/03/24.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/25/2024", institution: "Pagseguro", account: "mastercard", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 123, category: "software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
