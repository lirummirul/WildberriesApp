//
//  ContentView.swift
//  DatePicker
//
//  Created by Лада on 08.07.2024.
//

import SwiftUI
import Foundation

enum Flag: String, CaseIterable {
    case 🇷🇺
    case 🇬🇧
    case 🇫🇷
    case 🇩🇪
    case 🇪🇸
    
    var id: String {
        switch self {
        case .🇷🇺:
            return "ru_Ru"
        case .🇬🇧:
            return "en_US"
        case .🇫🇷:
            return "fr_FR"
        case .🇩🇪:
            return "de_DE"
        case .🇪🇸:
            return "es_ES"
        }
    }
}

struct ContentView: View {
    @State private var date = Date()
    @State private var selectedLanguage = 0
    @State private var labels = [String](repeating: "", count: 5)
//    @Binding var flag: Flag

    let calendar = Calendar.current
    let dateFormatter = DateFormatter()

    var body: some View {
        VStack {
            DatePicker("Date", selection: $date, displayedComponents: .date)
                .onChange(of: date) { _ in
                    updateLabels()
                }
                .padding(.init(top: 10, leading: 70, bottom: 10, trailing: 70))
            DatePicker("Time", selection: $date, displayedComponents: .hourAndMinute)
                .padding(.init(top: 10, leading: 70, bottom: 10, trailing: 70))
            
            
            Picker("", selection: $selectedLanguage) {
                ForEach(0 ..< Flag.allCases.count) { index in
                       Text(Flag.allCases[index].rawValue).tag(index)
                   }
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedLanguage) { _ in
                updateLabels()
//                let day_before_yesterday = "day_before_yesterday".localized
//                let yesterday = "yesterday".localized
//                let today = "today".localized
//                let tomorrow = "tomorrow".localized
//                let day_after_tomorrow = "day_after_tomorrow".localized
            }

//            Text("Позавчера: \(labels[0])")
//            Text("Вчера: \(labels[1])")
//            Text("Сегодня: \(labels[2])")
//            Text("Завтра: \(labels[3])")
//            Text("Послезавтра: \(labels[4])")
            
//            let yesterday = calendar.date(byAdding: .day, value: -1, to: date)!
            
            Text(NSLocalizedString("day_before_yesterday", comment: "") + ": \(labels[0])")
            Text(NSLocalizedString("yesterday", comment: "") + ": \(labels[1])")
            Text(NSLocalizedString("today", comment: "") + ": \(labels[2])")
            Text(NSLocalizedString("tomorrow", comment: "") + ": \(labels[3])")
            Text(NSLocalizedString("day_after_tomorrow", comment: "") + ": \(labels[4])")
        }
        .onAppear() {
            updateLabels()
        }
    }

    func updateLabels() {
        let selectedFlag = Flag.allCases[selectedLanguage]
//        dateFormatter.locale = Locale(identifier: ["ru_RU", "en_US", "fr_FR", "de_DE", "es_ES"][selectedLanguage])
        dateFormatter.locale = Locale(identifier: selectedFlag.id)
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short

        let yesterday = calendar.date(byAdding: .day, value: -1, to: date)!
        let dayBeforeYesterday = calendar.date(byAdding: .day, value: -2, to: date)!
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: date)!
        let dayAfterTomorrow = calendar.date(byAdding: .day, value: 2, to: date)!

        labels[0] = dateFormatter.string(from: dayBeforeYesterday)
        labels[1] = dateFormatter.string(from: yesterday)
        labels[2] = dateFormatter.string(from: date)
        labels[3] = dateFormatter.string(from: tomorrow)
        labels[4] = dateFormatter.string(from: dayAfterTomorrow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension String {
//    var localized: String {
//        return NSLocalizedString(self, comment: "")
//    }
//}
