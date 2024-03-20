//
//  TransactionModel.swift
//  ContabilizaAi
//
//  Created by Guilherme Alves on 18/03/24.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
    dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Transporte e automobilismo", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Contas e utilidades", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entretenimento", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Taxas", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Alimentação", icon: .hamburger)
    static let home = Category(id: 5, name: "Casa", icon: .home)
    static let income = Category(id: 5, name: "Renda", icon: .dollar_sign)
    static let shopping = Category(id: 5, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 5, name: "Transferência", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Transporte público", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Celular", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Filmes", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Taxa bancária", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Investimento", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Mantimentos", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurante", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Aluguel", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Suprimentos para casa", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Empréstimo", icon: .dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Fatura cartão de crédito", icon: .exchange_alt, mainCategoryId: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        feesAndCharges,
        foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Category] = categories + subCategories
    
}
