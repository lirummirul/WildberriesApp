//
//  WBWidgetEntryView.swift
//  WildberriesApp
//
//  Created by Лада on 05.07.2024.
//

import SwiftUI
import WidgetKit

struct WBWidgetEntryView : View {
    
    @StateObject var contactStore = ContactStore()
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry

    var body: some View {
        switch family {
        case .systemSmall:
            VStack {
                Text("Online Contacts:")
                    .font(.caption)
                
                ForEach(contactStore.contacts, id: \.id) { contact in
                    let date = contact.status
                    if getLastVisit(date: date) {
                        HStack {
                            if let avatar = contact.avatar {
                                Image(avatar)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                                    .foregroundColor(.purple)
                            }
                            Text(contact.name)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        case .systemMedium:
            VStack {
                Text("Online Contacts:")
                ForEach(contactStore.contacts, id: \.id) { contact in
                    let date = contact.status
                    if getLastVisit(date: date) {
//                        NavigationLink(destination: ContactDetailView(contact: contact)) {
                            Button(action: {}) {
                                HStack {
                                    if let avatar = contact.avatar {
                                        Image(avatar)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: "person.crop.circle")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                            .foregroundColor(.purple)
                                    }
                                    Text(contact.name)
                                        .foregroundColor(.black)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .buttonStyle(.plain)
//                            .padding(.all(6.0))
//                            .background(Color.purple)
//                            .cornerRadius(8.0, corners: .allCorners)
//                        }
                    }
                }
            }
        case .systemLarge:
            VStack {
                Text("Online Contacts:")
                ForEach(contactStore.contacts, id: \.id) { contact in
                    let date = contact.status
                    if getLastVisit(date: date) {
//                        NavigationLink(destination: ContactDetailView(contact: contact)) {
//                            Button(action: {}) {
                                HStack {
                                    HStack {
                                        if let avatar = contact.avatar {
                                            Image(avatar)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                        } else {
                                            Image(systemName: "person.crop.circle")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                                .foregroundColor(.purple)
                                        }
                                        Text(contact.name)
                                            .foregroundColor(.black)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
//                            }
//                        }
                    }
                }
            }
        case .systemExtraLarge: EmptyView()
        case .accessoryCorner: EmptyView()
        case .accessoryCircular: EmptyView()
        case .accessoryRectangular: EmptyView()
        case .accessoryInline: EmptyView()
        @unknown default: EmptyView()
        }
    }
    
    private func getLastVisit(date: Date) -> Bool {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.second, .minute, .hour, .day], from: date, to: now)
        if calendar.isDateInToday(date) {
            if components.second! < 5 && components.minute == 0 && components.hour == 0 {
                return true
            }
        }
        return false
    }
}

#Preview(as: .systemSmall) {
    WBWidget()
} timeline: {
    SimpleEntry(date: .now, contact: ContactStore().contacts.first!)
    SimpleEntry(date: .now, contact: ContactStore().contacts.first!)
}

#Preview(as: .systemMedium) {
    WBWidget()
} timeline: {
    SimpleEntry(date: .now, contact: ContactStore().contacts.first!)
    SimpleEntry(date: .now, contact: ContactStore().contacts.first!)
}

#Preview(as: .systemLarge) {
    WBWidget()
} timeline: {
    SimpleEntry(date: .now, contact: ContactStore().contacts.first!)
    SimpleEntry(date: .now, contact: ContactStore().contacts.first!)
}
