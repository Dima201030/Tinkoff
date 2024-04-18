//
//  AuthService.swift
//  Manager
//
//  Created by Дима Кожемякин on 23.02.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, age: Int) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid, age: age)
            loadCurrentUserData()
            
            
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    func singOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String, age: Int) async throws {
        let user = User(fullname: fullname, email: email, age: age, profileImageUrl: nil, money: 0, countCards: 0, countBusiness: 0, businessStatus: false)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    func changeUserData(email: String, fullname: String, id: String, age: Int, money: Int, countCards: Int, countBusiness: Int, businessStatus: Bool) async throws {
        do {
            let user = User(fullname: fullname, email: email, age: age, profileImageUrl: nil, money: money, countCards: countCards, countBusiness: countBusiness, businessStatus: businessStatus)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
        } catch {
            
        }
    }
    
    private func loadCurrentUserData() {
        Task { try await UserService.shared.fetchCurrentUser() }
    }
    
    func deleteUser() {
        let user = Auth.auth().currentUser

        user?.delete { error in
            if error != nil {
              self.singOut()
          } else {              
              self.singOut()
          }
        }
    }
    
}
