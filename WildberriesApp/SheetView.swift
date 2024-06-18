//
//  SheetView.swift
//  WildberriesApp
//
//  Created by Lambert Lani on 6/16/24.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

   var body: some View {
       VStack {
           Button("Dismiss") {
               presentationMode.wrappedValue.dismiss()
           }
       }
       .padding()
   }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
