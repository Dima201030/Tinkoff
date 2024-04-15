//
//  ColorBarView.swift
//  Tinkoff
//
//  Created by Дима Кожемякин on 14.04.2024.
//

import SwiftUI

struct ColorBarView: View {
    let categories: [String]
    let expenses: [Double]
    let totalExpenses: Double
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(0..<categories.count) { index in
                    let width = CGFloat(expenses[index] / totalExpenses) * geometry.size.width
                    Rectangle()
                        .fill(getColorForIndex(index))
                        .frame(width: width, height: 30)
                }
            }
        }
    }
    
    func getColorForIndex(_ index: Int) -> Color {
        // Здесь можно настроить цвета для каждой категории
        switch index {
        case 0:
            return Color.green
        case 1:
            return Color.blue
        case 2:
            return Color.orange
        default:
            return Color.gray
        }
    }
}

#Preview {
    ColorBarView(categories: ["Еда", "Транспорт", "Развлечения", "Прочее"], expenses: [300.0, 150.0, 200.0, 100.0], totalExpenses: 750.0 )
}
