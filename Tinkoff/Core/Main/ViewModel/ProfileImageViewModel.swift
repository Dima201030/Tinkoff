//
//  ProfileViewModel.swift
//  ExamMessager
//
//  Created by Дима Кожемякин on 03.02.2024.
//

import SwiftUI
import UIKit
import PhotosUI

class ProfileImageViewModel: ObservableObject {
    @Published var selectItme: PhotosPickerItem? {
        didSet { Task { try await loadImage() } }
    }
    @Published var profileImage: Image? = Image("CatIcon")
    @Published var averageColor: UIColor? = UIImage(named: "CatIcon")?.getAverageColour // Получаем средний цвет изображения "CatIcon" при его инициализации
    
    func loadImage() async throws {
        guard let item = selectItme else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        
        // Получение среднего цвета фрагмента изображения
        let fragmentImage = uiImage.cropToCenter(square: min(uiImage.size.width, uiImage.size.height))
        let averageColour = fragmentImage.getAverageColour
        
        // Выполнить обновление на главном потоке
        DispatchQueue.main.async {
            self.profileImage = Image(uiImage: uiImage)
            self.averageColor = averageColour
        }
    }
}
