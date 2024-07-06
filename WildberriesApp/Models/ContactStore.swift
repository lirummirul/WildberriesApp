//
//  ContactStore.swift
//  WildberriesApp
//
//  Created by Лада on 05.07.2024.
//

import Foundation
import SwiftUI

class ContactStore: ObservableObject {
    @Published var contacts: [Contact] = Contact.contacts
}
