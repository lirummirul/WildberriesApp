//
//  TappableText.swift
//  WildberriesApp
//
//  Created by Lambert Lani on 6/15/24.
//

import SwiftUI

struct TappableText: View {
//    rgba(154, 65, 254, 1)

    let color = Color(CGColor(red: 154/255, green: 65/255, blue: 254/255, alpha: 1))
    let text: String
    let action: () -> Void

    var body: some View {
        Text(text)
            .foregroundColor(color)
            .onTapGesture {
                action()
            }
    }
}
