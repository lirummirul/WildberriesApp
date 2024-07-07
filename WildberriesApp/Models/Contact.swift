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
    let status: Date
    let phoneNumber: String
}

extension Contact {
    static var contacts: [Contact] = [
        .init(id: UUID(), name: "Анастасия", lastName : "Иванова", avatar: .anastasiya, status: Date().addingTimeInterval(-86400), phoneNumber: "+79999999999"), // вчера
        .init(id: UUID(), name: "Петя", lastName : nil, avatar: .petya, status: Date(), phoneNumber: "+79999999998"), // онлайн
        .init(id: UUID(), name: "Маман", lastName : nil, avatar: .mama, status: Date().addingTimeInterval(-10800), phoneNumber: "+79999999997"), // 3 часа назад
        .init(id: UUID(), name: "Арбуз", lastName : "Дыня", avatar: .ar, status: Date(), phoneNumber: "+79999999996"), // онлайн
        .init(id: UUID(), name: "Иван", lastName : "Иванов", avatar: nil, status: Date(), phoneNumber: "+79999999995"), // оналайн
        .init(id: UUID(), name: "Лиса", lastName : "Алиса", avatar: nil, status: Date().addingTimeInterval(-1800), phoneNumber: "+79999999994") // 30 минут назад
    ]
}
