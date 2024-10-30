//
//  ContentView.swift
//  Socket Plug Exp
//
//  Created by Elisha Lye on 30/10/2024.
//

import SwiftUI
import DesignKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            doSomething("Passing Through")
            ItemRow(message: "")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ItemRow: View {
    let message: String
    var body: some View {
        Text(message)
    }
}

var doSomething: (String) -> PlugItemView = { data in
        return PlugItemView(content: AnyView(ItemRow(message: data)))
    }

