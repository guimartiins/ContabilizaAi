//
//  ContabilizaAiApp.swift
//  ContabilizaAi
//
//  Created by Guilherme Alves on 18/03/24.
//

import SwiftUI

@main
struct ContabilizaAiApp: App {
    @StateObject var transactionListViewModel = TransactionListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListViewModel)
        }
    }
}
