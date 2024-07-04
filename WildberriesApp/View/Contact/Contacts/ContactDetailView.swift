//
//  ContactDetailView.swift
//  WildberriesApp
//
//  Created by Лада on 30.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let colorDark = Color(CGColor(red: 42/255, green: 23/255, blue: 59/255, alpha: 1))
    let contact: Contact

    var body: some View {
        ZStack {
            if colorScheme == .dark {
                colorDark.edgesIgnoringSafeArea(.all)
            } else {
                Color.white.edgesIgnoringSafeArea(.all)
            }
            VStack {
                if let avatar = contact.avatar {
                    Image(avatar)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle")
                         .resizable()
                         .frame(width: 200, height: 200)
                         .clipShape(Circle())
                         .foregroundColor(.purple)
                }
                if let lastName = contact.lastName {
                    Text(contact.name + " " + lastName)
                        .font(.system(size: 30))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                } else {
                    Text(contact.name)
                        .font(.system(size: 30))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                
                Text(contact.phoneNumber)
                    .font(.system(size: 20))
                    .foregroundStyle(.gray)
                
                HStack {
                    getButton(name: "twitter")
                        .padding(5)
                    getButton(name: "instagram")
                        .padding(5)
                    getButton(name: "in")
                        .padding(5)
                    getButton(name: "facebook")
                        .padding(5)
                }
            }
        }
    }
    
    private func getButton(name: String) -> some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(name)
                .frame(width: 20, height: 20)
        })
        .padding(.init(top: 15, leading: 25, bottom: 15, trailing: 25))
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple, lineWidth: 3)
        )
    }
}

#Preview {
    ContactDetailView(contact: Contact.contacts.first!)
}
