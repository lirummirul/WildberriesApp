//
//  OpenChatIntent.swift
//  OpenChatIntent
//
//  Created by Лада on 07.07.2024.
//

import AppIntents

struct OpenChatIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Contact"
    static var description = IntentDescription("Open the chat page in yourapp")
    
    static var openAppWhenRun: Bool = true


    func perform() async throws -> some IntentResult & ReturnsValue<Void> {
        openContact()
        return .result()
    }

    func openContact() {
        let url = URL(string: "wildberriesapp://chat")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
}
