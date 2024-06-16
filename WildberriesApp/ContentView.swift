//
//  ContentView.swift
//  WildberriesApp
//
//  Created by Lambert Lani on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            ОnboardingView()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
