//
//  MainView.swift
//  Tinkoff
//
//  Created by Дима Кожемякин on 14.04.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @Environment(\.colorScheme) var colorScheme
    let categories = ["Еда", "Транспорт", "Развлечения", "Прочее"]
    let expenses = [300.0, 150.0, 200.0, 100.0] // Расходы для каждой категории
    let totalExpenses = 750.0 // Общая сумма расходов
    @State private var searchText = ""
    @State private var sheetNewProductIsActive = false
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    NameTextAndImage(profileViewModel: profileViewModel)
                    
                    //                    ScrollView(.horizontal, showsIndicators: false) {
                    //                        HStack {
                    //                            ForEach(0...3, id: \.self) { index in
                    //                                VStack {
                    //                                    Text("Tinkoff")
                    //                                }
                    //                                .frame(width: 100, height: 100)
                    //                                .background(profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black))
                    //                                .cornerRadius(15)
                    //                            }
                    //                        }
                    //                        .padding(.horizontal, 8)
                    //                    }
                    //                    .offset(y: -20)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(5)
                        TextField("Искать", text: $searchText)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        
                            .padding(.vertical, 5)
                        Spacer()
                    }
                    .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.white)
                    
                    .cornerRadius(7)
                    .padding(.horizontal)
                    .shadow(color: colorScheme == .dark ? Color.black : Color.gray.opacity(0.4), radius: 10)
                    Events()
                    
                    ForEach(0...2, id: \.self) { index in
                        Carts()
                    }
                    
                    
                    Button {
                        sheetNewProductIsActive.toggle()
                    } label: {
                        Text("Открыть новый счет или продукт")
//                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .padding(8)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 342, height: 50)
                            .background(profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black))
                            .cornerRadius(10)
                    }
                    .cornerRadius(10)


                    
                    
                    Spacer()
                }
                
                
            }
            .navigationTitle("Главная")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $sheetNewProductIsActive) {
                NewProductView()
            }
        }
    }
}

#Preview {
    MainView()
}
