//
//  ContentView.swift
//  Manager
//
//  Created by Дима Кожемякин on 23.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @EnvironmentObject var appData: AppData
    var body: some View {
        VStack {
            Group {
                if viewModel.userSession != nil {
                    TabView {
                        MainView()
                            .tabItem {
                                Label("Главная",
                                      systemImage: "house")
                            }
                        Text("Платежи")
                            .tabItem {
                                Label("Платежи",
                                      systemImage: ""
                                )
                            }
                        Text("Город")
                            .tabItem {
                                Label("Город",
                                      systemImage: "")
                            }
                        Text("Чат")
                            .tabItem {
                                Label("Чат",
                                      systemImage: "")
                            }
                        Text("Еще")
                            .tabItem {
                                Label("Еще",
                                      systemImage: "")
                            }
                    }
                } else {
                    LoginView()
                }
                
            }
        }
        
        
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    ContentView()
        .environmentObject(AppData())
}
