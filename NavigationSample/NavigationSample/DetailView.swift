//
//  DetailView.swift
//  NavigationSample
//
//  Created by Dandan Meng on 2026/1/8.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let number: Int

    var body: some View {
        List {
            Section {
                ForEach(0..<30) { index in
                    Text("Detail \(number) – Row \(index)")
                }
            }
        }
        .navigationTitle("Item \(number)")
        .toolbarTitleDisplayMode(.large)
    }
}
