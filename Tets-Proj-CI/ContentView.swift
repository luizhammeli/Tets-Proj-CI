//
//  ContentView.swift
//  Tets-Proj-CI
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

    func test() -> String {
        let id = 1 + 1
        return "Luiz\(id)"
    }

    func test2() -> String {
        let id = 1 + 1
        return "Luiz\(id)"
    }

    func test3() -> String {
        let id = 1 + 1
        return "Luiz\(id)"
    }
}

#Preview {
    ContentView()
}
