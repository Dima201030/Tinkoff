//
//  TinkoffTests.swift
//  TinkoffTests
//
//  Created by Дима Кожемякин on 12.04.2024.
//

import XCTest
import FirebaseAuth
@testable import Tinkoff

class AuthServiceTests: XCTestCase {
    
    var authService: AuthService!
    
    override func setUpWithError() throws {
        authService = AuthService()
    }
    
    override func tearDownWithError() throws {
        authService = nil
    }
    
    func testLogin() {
        // Создание фейковых данных пользователя
        let email = "test@example.com"
        let password = "password"
        
        // Создание expectation для ожидания асинхронного вызова
        let expectation = XCTestExpectation(description: "Login")
        
        // Выполнение асинхронной функции с использованием async/await
        Task {
            do {
                try await authService.login(withEmail: email, password: password)
                // Проверка, что пользователь авторизован успешно и userSession не равен nil
                XCTAssertNotNil(authService.userSession)
                expectation.fulfill()
            } catch {
                // Обработка ошибок, если они возникли
                XCTFail("Login failed with error: \(error)")
            }
        }
        
        // Ожидание выполнения expectation в течение определенного времени (например, 5 секунд)
        wait(for: [expectation], timeout: 5)
    }




    func testDeleteUser() {
        // Создание expectation для ожидания асинхронного вызова
        let expectation = XCTestExpectation(description: "Delete User")
        
        // Вызов метода удаления пользователя
        authService.deleteUser()
        
        // Проверка, что пользователь успешно удален и userSession равен nil
        XCTAssertNil(authService.userSession)
        
        // Отмечаем expectation как выполненное
        expectation.fulfill()
        
        // Ожидание выполнения expectation в течение определенного времени (например, 5 секунд)
        wait(for: [expectation], timeout: 5)
    }



    
    func testCreateUser() async throws {
        // Тестирование функционала создания пользователя
        
        // Создание фейковых данных нового пользователя
        let email = "test1@example.com1"
        let password = "password1"
        let fullname = "Тестовый Пользователь"
        let age = 30
        
        // Мокирование метода createUser Firebase Auth и проверка функционала создания пользователя
        try await authService.createUser(withEmail: email, password: password, fullname: fullname, age: age)
        // Проверка, что пользователь успешно создан и userSession не равен nil
        XCTAssertNotNil(authService.userSession)
    }
    
    func testSignOut() throws {
        // Тестирование функционала выхода
        
        // Вызов метода выхода пользователя
        authService.singOut()
        // Проверка, что сессия пользователя корректно очищена и userSession равен nil
        XCTAssertNil(authService.userSession)
    }
    
    func testChangeUserData() async throws {
        // Тестирование функционала изменения данных пользователя
        
        // Создание фейковых данных пользователя
        let email = "test@example.com"
        let fullname = "Новое Имя"
        let id = "userID"
        let age = 35
        let money = 1000
        let countCards = 2
        let countBusiness = 1
        let businessStatus = true
        
        // Мокирование метода изменения данных пользователя в Firestore и проверка корректности изменений
        try await authService.changeUserData(email: email, fullname: fullname, id: id, age: age, money: money, countCards: countCards, countBusiness: countBusiness, businessStatus: businessStatus)
        // Проверка, что данные пользователя успешно обновлены в Firestore
        // Можно использовать дополнительные запросы к Firestore для проверки обновленных данных, если это необходимо
    }
        
    func testErrorHandling() throws {
        // Тестирование обработки ошибок
        
        // Мокирование методов Firebase Auth и Firestore для создания сценариев с ошибками и проверка корректной обработки ошибок
        // Например, вызов функции с неверными данными и проверка, что ошибка обработана корректно
    }
}
