//
//  ContactsView.swift
//  WildberriesApp
//
//  Created by Лада on 30.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.colorScheme) var colorScheme
    let colorDark = Color(CGColor(red: 42/255, green: 23/255, blue: 59/255, alpha: 1))
    @State private var contacts: [Contact] = Contact.contacts
    
    var body: some View {
        NavigationView {
            VStack {
                SearchTextField()
                    .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
                List(contacts) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)
//                        .navigationBarBackButtonHidden(true)
//                        .toolbar {
//                            ToolbarItem(placement: .navigationBarLeading) {
//                                Button(action: {
//                                    self.presentationMode.wrappedValue.dismiss()
//                                }) {
//                                    HStack {
//                                        Image(systemName: "chevron.left")
//                                        Text("Контакты")
//                                    }
//                                    .foregroundColor(colorScheme == .dark ? .white : .black)
//                                }
//                            }
//                        }
                    ) {
                        HStack {
                            if let avatar = contact.avatar {
                                Image(avatar)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                            } else {
                                getNameForPhoto(name: contact.name, lastName: contact.lastName)
                            }
                            VStack(alignment: .leading) {
                                if let lastName = contact.lastName {
                                    Text(contact.name + " " + lastName)
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                } else {
                                    Text(contact.name)
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                }
                                if let status = contact.status {
                                    Text(status)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .listRowBackground(colorScheme == .dark ? colorDark : Color.white)
                }
                .listStyle(PlainListStyle())
            }
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Text("Контакты")
                        .padding(.init(top: 15, leading: 15, bottom: 5, trailing: 30))
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                    .padding(.init(top: 15, leading: 15, bottom: 5, trailing: 10))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
            .background(colorScheme == .dark ? colorDark : Color.white)
        }
    }
    
    private func getNameForPhoto(name: String, lastName: String?) -> some View {
        let first = name.first.map { String($0) } ?? ""
        let second = lastName?.first.map { String($0) } ?? ""
        let res = first + second
        return Text(res)
            .frame(width: 50, height: 50)
            .background(.purple)
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .foregroundColor(.white)
            .bold()
    }
    
    
}

#Preview {
    ContactsView()
}
