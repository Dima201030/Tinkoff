//
//  ContentView.swift
//  Manager
//
//  Created by Дима Кожемякин on 23.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @EnvironmentObject var appData: AppData // Добавляем объект AppData в окружение
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainView()
            } else {
                LoginView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData()) // Передаем объект AppData через environmentObject
    }
}
