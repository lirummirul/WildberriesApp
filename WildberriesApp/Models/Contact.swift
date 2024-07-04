//
//  Contact.swift
//  WildberriesApp
//
//  Created by Лада on 30.06.2024.
//

import SwiftUI

struct Contact: Identifiable {
    let id: UUID
    let name: String
    let lastName: String?
    var avatar: ImageResource? = nil
    let status: String?
    let phoneNumber: String
}

extension Contact {
    static var contacts: [Contact] = [
        .init(id: UUID(), name: "Анастасия", lastName : "Иванова", avatar: .anastasiya, status: "Last seen yesterday", phoneNumber: "+79999999999"),
        .init(id: UUID(), name: "Петя", lastName : nil, avatar: .petya, status: "Online", phoneNumber: "+79999999998"),
        .init(id: UUID(), name: "Маман", lastName : nil, avatar: .mama, status: "Last seen 3 hours ago", phoneNumber: "+79999999997"),
        .init(id: UUID(), name: "Арбуз", lastName : "Дыня", avatar: .ar, status: "Online", phoneNumber: "+79999999996"),
        .init(id: UUID(), name: "Иван", lastName : "Иванов", avatar: nil, status: "Online", phoneNumber: "+79999999995"),
        .init(id: UUID(), name: "Лиса", lastName : "Алиса", avatar: nil, status: "Last seen 30 minutes ago", phoneNumber: "+79999999994")
    ]
}
