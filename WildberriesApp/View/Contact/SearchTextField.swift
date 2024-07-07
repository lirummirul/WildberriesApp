//
//  SearchBar.swift
//  WildberriesApp
//
//  Created by Лада on 04.07.2024.
//

import SwiftUI
import Combine

struct SearchTextField: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchContact: String = ""
    
    var backDark: Color = Color(CGColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1))
    var backLight: Color = Color(CGColor(red: 25/255, green: 14/255, blue: 38/255, alpha: 1))
    
    var body: some View {
        HStack() {
            Spacer()
            Image("search")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(colorScheme == .dark ? .black : .white)
            
            TextField("Search", text: $searchContact)
                .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 30))
                .frame(height: 40)
        }
        .background(colorScheme == .dark ? backLight : backDark)
        .font(Font.custom("Montserrat-Medium", size: 15))
        .cornerRadius(10)
        .padding(.leading, 20)
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .padding(.trailing, 20)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField()
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
