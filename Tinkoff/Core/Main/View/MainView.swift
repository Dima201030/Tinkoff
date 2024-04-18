import SwiftUI
struct MainView: View {
    @StateObject var profileViewModel = ProfileImageViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    @State private var sheetNewProductIsActive = false
    @StateObject var userViewModel = UserViewModel() // Создаем UserViewModel здесь
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    NameTextAndImage(profileViewModel: profileViewModel)
                    
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
                    
                    if let user = userViewModel.user {
                        ForEach(0..<user.countCards, id: \.self) { _ in
                            Carts()
                        }
                    }
                    
                    Button(action: {
                        if var user = userViewModel.user {
                            user.countCards += 1
                            // Здесь можно добавить обновление данных в базе данных, если это необходимо
                        }
                    }) {
                        Text("Добавить карту")
                            .padding(8)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 342, height: 50)
                            .background(.red)
                            .cornerRadius(10)
                    }
                    .cornerRadius(10)
                    
                    Button(action: {
                        sheetNewProductIsActive.toggle()
                    }) {
                        Text("Открыть новый счет или продукт")
                            .padding(8)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 342, height: 50)
                            .background(profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black))
                            .cornerRadius(10)
                    }
                    .cornerRadius(10)
                    
                    Button(action: {
                        AuthService.shared.singOut()
                    }) {
                        Text("Log out")
                            .padding(8)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 342, height: 50)
                            .background(.red)
                            .cornerRadius(10)
                    }
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Главная")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $sheetNewProductIsActive) {
                NewProductView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
