//
//  LayoutComparisonWithMetricsView.swift
//  ViewSamples
//
//  Created by Dandan Meng on 2025/10/21.
//

import SwiftUI

struct LayoutComparisonWithMetricsView: View {
    let items = Array(1...100).map { "Item \($0)" }

    @State private var vStackVisible = 0
    @State private var lazyVisible = 0
    @State private var listVisible = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {

                // MARK: VStack
                SectionView(
                    title: "VStack (Eager)",
                    description: "All 100 items are created immediately. Visible count = all.",
                    visibleCount: vStackVisible,
                    content: {
                        VStack {
                            ForEach(items, id: \.self) { item in
                                TrackableRow(label: item, color: .yellow, onVisibleChange: { isVisible in
                                    vStackVisible += isVisible ? 1 : -1
                                })
                            }
                        }
                        .frame(height: 200)
                        .clipped()
                    }
                )

                // MARK: LazyVStack
                SectionView(
                    title: "LazyVStack (Inside ScrollView)",
                    description: "Only visible items are rendered as you scroll.",
                    visibleCount: lazyVisible,
                    content: {
                        ScrollView {
                            LazyVStack {
                                ForEach(items, id: \.self) { item in
                                    TrackableRow(label: item, color: .green, onVisibleChange: { isVisible in
                                        lazyVisible += isVisible ? 1 : -1
                                    })
                                }
                            }
                        }
                        .frame(height: 200)
                    }
                )

                // MARK: List
                SectionView(
                    title: "List (Lazy and efficient)",
                    description: "Rows load only when visible. Check visible count as you scroll.",
                    visibleCount: listVisible,
                    content: {
                        List(items, id: \.self) { item in
                            TrackableRow(label: item, color: .blue, onVisibleChange: { isVisible in
                                listVisible += isVisible ? 1 : -1
                            })
                        }
                        .frame(height: 200)
                    }
                )
            }
            .padding()
        }
        .navigationTitle("Lazy Loading Comparison")
    }
}

// MARK: - Row with Visibility Tracking
struct TrackableRow: View {
    let label: String
    let color: Color
    let onVisibleChange: (Bool) -> Void

    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity)
            .padding()
            .background(color.opacity(0.3))
            .cornerRadius(8)
            .onAppear {
                print("✅ Appeared: \(label)")
                onVisibleChange(true)
            }
            .onDisappear {
                print("❌ Disappeared: \(label)")
                onVisibleChange(false)
            }
    }
}

// MARK: - Section Layout
struct SectionView<Content: View>: View {
    let title: String
    let description: String
    let visibleCount: Int
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("👁️ Visible Rows: \(visibleCount)")
                .font(.subheadline)
                .foregroundColor(.blue)

            content
        }
    }
}

#Preview {
    LayoutComparisonWithMetricsView()
}
