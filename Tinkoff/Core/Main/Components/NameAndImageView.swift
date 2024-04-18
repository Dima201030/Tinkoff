//
//  NameAndImageView.swift
//  Tinkoff
//
//  Created by Дима Кожемякин on 14.04.2024.
//

import SwiftUI
import PhotosUI

struct NameTextAndImage: View {
    @Environment (\.colorScheme) var colorScheme
    @ObservedObject var profileViewModel: ProfileImageViewModel
    
    var body: some View {
        HStack  {
            HStack{
                ZStack {
                    Circle()
                        .frame(width: 57, height: 57)
                        .foregroundColor(profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black))
                    
                    PhotosPicker(selection: $profileViewModel.selectItme) {
                        if let profileImage = profileViewModel.profileImage {
                            profileImage
                                .resizable()
                                .cornerRadius(15)
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                                .shadow(color: profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black), radius: 15) // Use average color in shadow
                            
                        } else {
                            Image("person.circle")
                                .resizable()
                                .cornerRadius(15)
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                                .shadow(color: profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black), radius: 15) // Use average color in shadow
                            
                        }
                    }
                }
                Button {
                    vibrate()
                } label: {
                    Text("Дмитрий")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 15)
                        .fontWeight(.bold)
                        .scaledToFill()
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .shadow(color: profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black), radius: 10)
                }
                
            }
            .padding()
            .onTapGesture {
                vibrate()
            }
            
            Spacer()
            Button {
                // Action for gift
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black))
                    
                    Image(systemName: "gift.fill")
                        .resizable()
                        .foregroundColor(colorScheme == .dark ? .black : .white )
                        .frame(width: 20, height: 20)
                        .shadow(color: profileViewModel.averageColor.map { Color($0) } ?? (colorScheme == .dark ? Color.white : Color.black), radius: 10)
                }
            }
            .padding()
            .onTapGesture {
                vibrate()
            }
        }
        .padding(.horizontal, 8)
    }
    
    private func vibrate() {
        // Create a haptic feedback generator instance
        let generator = UINotificationFeedbackGenerator()
        // Specify the type of feedback
        
        generator.notificationOccurred(.success) // Can use .warning or .error as well
    }
}

#Preview {
    NameTextAndImage(profileViewModel: ProfileImageViewModel())
}
