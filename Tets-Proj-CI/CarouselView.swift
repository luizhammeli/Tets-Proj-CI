//
//  ContentView.swift
//  Tets-Proj-CI
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import SwiftUI

struct CarouselItem: Identifiable {
    let id = UUID()
    let color: Color
    let title: String
    let systemImage: String
}

struct CarouselView: View {
    let items: [CarouselItem]
    @State private var currentIndex = 0

    init(items: [CarouselItem]) {
        currentIndex = 1
        self.items = items
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TabView(selection: $currentIndex) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(item.color)
                        VStack {
                            if !item.systemImage.isEmpty {
                                Image(systemName: item.systemImage)
                                    .font(.system(size: 48))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 8)
                            }
                            Text(item.title)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .padding(.horizontal, 16)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 220)
        }
    }

    func test() -> Int {
        return 2 + 2
    }
}
