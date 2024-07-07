//
//  WBWidget.swift
//  WBWidget
//
//  Created by Лада on 04.07.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    let contacts = ContactStore().contacts
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contact: contacts.first!)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), contact: contacts.first!)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contact: contacts.first!)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contact: Contact
}

struct WBWidget: Widget {
    let kind: String = "WBWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

