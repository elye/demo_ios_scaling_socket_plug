//
//  ContentView.swift
//  Socket Plug Exp
//
//  Created by Elisha Lye on 30/10/2024.
//

import SwiftUI
import DesignKit
import TeamA
import TeamB

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                        VStack {
                            NavigationLink(destination: TeamAContentView()) {
                                Text("Access Team A List View")
                            }
                            NavigationLink(destination: TeamBContentView()) {
                                Text("Access Team B Tab View")
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
