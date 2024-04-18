import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var user: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        Task {
            do {
                try await UserService.shared.fetchCurrentUser()
            } catch {
                print("Failed to fetch current user: \(error.localizedDescription)")
            }
        }
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.user = user
        }.store(in: &cancellables)
    }
}
