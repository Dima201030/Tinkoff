//
//  NewProductView.swift
//  Tinkoff
//
//  Created by Дима Кожемякин on 14.04.2024.
//

import SwiftUI

struct NewProductView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack {
                            HStack {
                                Text("Заказать допкарту")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(8)
                        .frame(width: 100, height: 120)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        VStack {
                            HStack {
                                Text("Добавить валюту ")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(8)
                        .frame(width: 100, height: 120)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        VStack {
                            HStack {
                                Text("Создать сбор денег")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(8)
                        .frame(width: 100, height: 120)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        VStack {
                            HStack {
                                Text("Поделиться счетом")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(8)
                        .frame(width: 100, height: 120)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                    }
                    
                    .padding()
                }
                
                VStack {
                    HStack {
                        Text("Банковские карты")
                            .fontWeight(.bold)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Все 15")
                        }
                        
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VStack(alignment: .leading) {
                                Image("TinkofBlack")
                                    .resizable()
                                    .frame(width: 140, height: 90)
                                    .cornerRadius(5)
                                Text("Кредитная карта")
                                    .font(.caption2)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .frame(width: 140)
                                Text("Тинькофф Платинум")
                                    .frame(width: 140)
                                    .lineLimit(1)
                                    .fontWeight(.bold)
                            }
                            VStack(alignment: .leading) {
                                Image("TinkofBlack")
                                    .resizable()
                                    .frame(width: 140, height: 90)
                                    .cornerRadius(5)
                                Text("Кредитная карта")
                                    .font(.caption2)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .frame(width: 140)
                                Text("Тинькофф Платинум")
                                    .frame(width: 140)
                                    .lineLimit(1)
                                    .fontWeight(.bold)
                            }
                            VStack(alignment: .leading) {
                                Image("TinkofBlack")
                                    .resizable()
                                    .frame(width: 140, height: 90)
                                    .cornerRadius(5)
                                Text("Кредитная карта")
                                    .font(.caption2)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .frame(width: 140)
                                Text("Тинькофф Платинум")
                                    .frame(width: 140)
                                    .lineLimit(1)
                                    .fontWeight(.bold)
                            }
                            .padding(8)
                        }
                        .padding()
                    }
                    
                    .offset(y: -20)
                }
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("Sovmestn")
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Совместный счет")
                                .fontWeight(.bold)
                            Text("Отдельный счет для общих трат")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("Vklad")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Вклад")
                                .fontWeight(.bold)
                            Text("Доходность до 11,57%, снятие денег без потери прцентов")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("Nakop")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Инвесткопилка")
                                .fontWeight(.bold)
                            Text("Откладывайте по чуть-чуть с доходностью до 17,7%")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("InvestKopilka")
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Совместный счет")
                                .fontWeight(.bold)
                            Text("Отдельный счет для общих трат")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("Invest")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Инвестиции")
                                .fontWeight(.bold)
                            Text("Отдельный счет для общих трат")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("SimCart")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Сим карта")
                                .fontWeight(.bold)
                            Text("Защита от машенников и 600 бесплатных минут")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("Pro")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Подписка Pro ")
                                .fontWeight(.bold)
                            Text("С доходностью до 16,07% годовых в рублях")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)

                Divider()
                
                VStack {
                    HStack {
                        ZStack {
                            Color.white
                            Image("Vklad")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Привязать карту")
                                .fontWeight(.bold)
                            Text("Другого банка или допкарту Тинькофф для вас")
                                .font(.caption)
                        }
                        
                        Spacer() // Добавленный Spacer для выравнивания по вертикали
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(8)
                
            }
            .navigationTitle("New product")
        }
    }
}

#Preview {
    NewProductView()
}
