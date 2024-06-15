//
//  ОnboardingView.swift
//  WildberriesApp
//
//  Created by Lambert Lani on 6/15/24.
//


import SwiftUI

struct ОnboardingView: View {
    @State private var isActive = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            if colorScheme == .dark {
                Image("light")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.top, 50)
            } else {
                Image("dark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.top, 50)
            }
            Text("Общайтесь с друзьями и близкими легко")
                .font(.system(size: 25))
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .dark ? Color.gray : Color.gray.opacity(0.5))
                .padding(.top, 30)
                .padding(.bottom, 100)
            
            Text("Нажимая кнопку продолжить я соглашаюсь с ")
                .font(.system(size: 11))
                .foregroundColor(Color.gray)
            
                HStack {
                    TappableText(text: "Политикой Конфиденциальности") {
                        print("Политикой Конфиденциальности")
                    }
                    .font(.system(size: 11))
                    Text("и")
                        .font(.system(size: 11))
                    TappableText(text: "Условиями Использования") {
                        print("Условиями Использования")
                    }
                    .font(.system(size: 11))
               }
                .multilineTextAlignment(.center)
            
            Button("Начать общаться") {
                isActive = true
            }
            .foregroundColor(.white)
            .font(.system(size: 20))
            .frame(width: 300, height: 20)
            .padding()
            .background(Color.purple)
            .cornerRadius(30)
        }
        .fullScreenCover(isPresented: $isActive) {
            ContentView()
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

struct ОnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ОnboardingView()
    }
}
