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
            let keywords = ["chives", "fern-leaf lavender"]
            VStack {
                ForEach(keywords, id: \.self) { word in
                    KeywordBubbleDefaultPadding(keyword: word, symbol: "leaf")
                }
            }
        }
    }
}
