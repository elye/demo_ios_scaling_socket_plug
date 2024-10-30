//
//  ContentView.swift
//  Socket Plug Exp
//
//  Created by Elisha Lye on 30/10/2024.
//

import SwiftUI
import DesignKit
import TeamA

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                        VStack {
                            Text("Hello World")
                            NavigationLink(destination: TeamAContentView()) {
                                Text("Do Something")
                            }
                        }
                    }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
