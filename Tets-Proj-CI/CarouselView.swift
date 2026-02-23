//
//  ContentView.swift
//  Tets-Proj-CI
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import SwiftUI

struct CarouselView: View {
    @State private var currentIndex = 0

    init() {
        currentIndex = 1
    }

    var body: some View {
        EmptyView()
    }

    func test() -> Int {
        return 2 + 2
    }
}
