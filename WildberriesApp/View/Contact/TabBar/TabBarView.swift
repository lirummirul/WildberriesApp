//
//  TabBarView.swift
//  WildberriesApp
//
//  Created by Лада on 01.07.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab: TabType = .contact
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment.bottom) {
                TabView(selection: $selectedTab) {
                    contact.tag(TabType.contact)
                    chat.tag(TabType.chat)
                    profile.tag(TabType.profile)
                }
                
                HStack(spacing: 0) {
                    TabBarItem(selectedIcon: Image("contactSelect"),
                            unselectedIcon: colorScheme == .dark ? Image("contactLight") : Image("contactDark"),
                            itemWidth: geometry.size.width / 3,
                            isSelected: selectedTab ==  .contact,
                            onTap: {
                                selectedTab = .contact
                            })
                            .onTapGesture {
                                selectedTab = .contact
                            }
                    
                    TabBarItem(selectedIcon: Image("chatSelect"),
                               unselectedIcon: colorScheme == .dark ? Image("chatLight") : Image("chatDark"),
                               itemWidth: geometry.size.width / 3,
                               isSelected: selectedTab ==  .chat,
                               onTap: {
                                   selectedTab = .chat
                               })
                               .onTapGesture {
                                   selectedTab = .chat
                               }
                    
                    TabBarItem(selectedIcon: Image("profileSelect"),
                               unselectedIcon: colorScheme == .dark ? Image("profileLight") : Image("profileDark"),
                               itemWidth: geometry.size.width / 3,
                               isSelected: selectedTab ==  .profile,
                               onTap: {
                                   selectedTab = .profile
                                   print("isSelected: \(selectedTab == .profile)")
                               })
                               .onTapGesture {
                                   selectedTab = .profile
                               }
                }
            }
        }
    }
    
    private var contact: some View {
        ContactsView()
    }
    
    private var chat: some View {
        ChatsView()
    }
    
    private var profile: some View {
        ProfileView()
    }
}

#Preview {
    TabBarView()
}
