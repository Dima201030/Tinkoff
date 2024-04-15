//
//  Events.swift
//  Tinkoff
//
//  Created by Дима Кожемякин on 14.04.2024.
//

import SwiftUI

struct Events: View {
    @Environment (\.colorScheme) var colorScheme
    let categories = ["Еда", "Транспорт", "Развлечения", "Прочее"]
    let expenses = [4314.0, 44400.0, 3456.0, 21333.0] // Расходы для каждой категории
    let totalExpenses = 73453 // Общая сумма расходов
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Все операции")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Траты в апреле")
                
                Text(73453.formattedWithSeparator())
                Spacer()
                ColorBarView(categories: categories, expenses: expenses, totalExpenses: Double(totalExpenses))
                    .frame(height: 13)
                    .cornerRadius(15)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.white)
            .cornerRadius(25)
            
            VStack(alignment: .leading) {
                Text("Кэшбэки и бонусы")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                HStack(alignment: .center) {
                    Image("Befree")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(15)
                        .scaledToFill()
                    
                    Image("Pyterka")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(15)
                        .scaledToFill()
                    
                    Image("Diksi")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(15)
                        .scaledToFill()
                }
                .padding(.vertical, 8)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.white)
            .cornerRadius(25)
            
            
        }
        
        .padding(.horizontal)
        .shadow(color: colorScheme == .dark ? Color.black : Color.gray.opacity(0.5), radius: 20)
        
    }
}


#Preview {
    Events()
}
