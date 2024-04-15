//
//  Carts.swift
//  Tinkoff
//
//  Created by Дима Кожемякин on 14.04.2024.
//

import SwiftUI

struct Carts: View {
    @Environment (\.colorScheme) var colorScheme
    var body: some View {
        
        //        Button {
        //
        //        } label: {
        //            HStack {
        //                Text("dddfsdf")
        //            }
        //
        //            .background(Color.gray)
        //        }
        //        .background(Color.gray)
        //        .frame(width: UIScreen.main.bounds.height / 2 , height: UIScreen.main.bounds.height \ 2)
        
        
        Button(action: { }) {
            HStack {
                
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        Text("$")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                }
                VStack(alignment: .leading) {
                    Text(6742.formattedWithSeparator())
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Text("Эх")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Image("TinkofBlack")
                        .resizable()
                        .frame(width: 50, height: 35)
                        .cornerRadius(5)
                    Spacer()
                }
                .padding(8)
                .foregroundColor(.white)
                
                Spacer()
                VStack {
                    ZStack {
                        Color(colorScheme == .dark ? Color.gray.opacity(0.4) : Color.black.opacity(0.7))
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                            Text("11 $")
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 50, height: 20)
                    .cornerRadius(20)
                    Spacer()
                }
                .foregroundColor(.white)
            }
            .padding()
            .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.white)
            .cornerRadius(25)
        }
        
        .padding(.horizontal)
        .padding(.vertical, 8)
        .contextMenu {
            Button(action: {}) {
                Text("Скрыть")
            }
            
            Button(action: {}) {
                Text("Добавить в избранное")
            }
            
            Divider()
            Menu {
                Button {
                    
                } label: {
                    Text("Отмена")
                }
                Button {
                    
                } label: {
                    Text("Удалить")
                }
                
            } label: {
                Text("Удалить")
                
            }
            
        }
        
        .shadow(color: colorScheme == .dark ? Color.black : Color.gray.opacity(0.4), radius: 20)
    }
}

#Preview {
    Carts()
}
