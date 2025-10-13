//
//  KeywordBubbleApp.swift
//  KeywordBubble
//
//  Created by Dandan Meng on 2025/10/13.
//

import SwiftUI

@main
struct KeywordBubbleApp: App {
    var body: some Scene {
        WindowGroup {
            KeywordBubbleDefaultPadding(keyword: "hello", symbol: "leaf")
        }
    }
}
