//
//  TabBarItem.swift
//  WildberriesApp
//
//  Created by Лада on 03.07.2024.
//

import SwiftUI

struct TabBarItem: View {
    
    @Environment(\.colorScheme) var colorScheme
    let colorDark = Color(CGColor(red: 130/255, green: 7/255, blue: 232/255, alpha: 1))
        
    let selectedIcon: Image
    let unselectedIcon: Image
    let itemWidth: CGFloat
    let isSelected: Bool
    let onTap: () -> ()
    
    var body: some View {
        Button {
            onTap()
        } label: {
            VStack(alignment: .center, spacing: 40.0) {
                ZStack(alignment: .bottomLeading) {
                    ZStack {
                        (isSelected ? selectedIcon : unselectedIcon)
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 65.0, height: 50.0)
//                            .foregroundColor(isSelected ? (colorScheme == .dark ? colorDark : .white ) : .white )
                    }
                }
            }
            .frame(width: itemWidth)
        }
        .buttonStyle(.plain)
    }
}
