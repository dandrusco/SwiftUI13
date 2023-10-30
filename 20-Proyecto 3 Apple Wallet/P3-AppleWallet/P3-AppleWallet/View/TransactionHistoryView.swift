//
//  TransactionView.swift
//  P3-AppleWallet
//
//  Created by Danilo Andrusco on 30-10-23.
//

import SwiftUI

struct TransactionHistoryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Historial de compras")
                    .font(.system(size: 20, weight: .black, design: .rounded))
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 25) {
                    ForEach(transactions){ t in
                        TransactionView(transaction: t)
                    }
                }.padding()
            }
        }
    }
}

struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.gray)
            .overlay(
                VStack {
                    Spacer()
                    Text(transaction.date)
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.black)
                        .padding(.top)
                    
                    Image(systemName: transaction.icon)
                        .font(.system(size: 40))
                        .foregroundStyle(.green)
                        .padding()
                    
                    Text(transaction.seller)
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.black)
                    
                    Text("$ \(String(format: "%.2f", transaction.amount))")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.black)
                        .padding(.bottom)
                    Spacer()
                }
            ).frame(width: 220, height: 220)
    }
}

#Preview {
    TransactionHistoryView()
}
