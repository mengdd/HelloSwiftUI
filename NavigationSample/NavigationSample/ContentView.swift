//
//  ContentView.swift
//  NavigationSample
//
//  Created by Dandan Meng on 2026/1/8.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List(1...100, id: \.self) { number in
        NavigationLink {
          DetailView(number: number)
        } label: {
          Text("Item \(number)")
        }
      }
      .navigationTitle("Numbers")
      .toolbarTitleDisplayMode(.large)
    }
  }
}

#Preview {
    ContentView()
}
