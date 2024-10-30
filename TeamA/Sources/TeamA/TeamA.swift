// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import DesignKit

public struct TeamAContentView : View {
    public init() {}
    public var body: some View {
        VStack {
            Text("I am in Team A")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            SocketListView(
                items: [
                    ("TeamAPlug", "Passing Through"),
                    ("TeamBPlug1", "To our neighbour"),
                    ("TeamBPlug2", "Smaller one"),
                    ("TeamCPlug", "SORRY"),
                ]
            )
        }
    }
}

public class RegisterATeam {
    public static func registerATeam() {
        PlugItemRegistry.register(key: "TeamAPlug", function: doSomething)
    }
}

struct ItemRow: View {
    let message: String
    var body: some View {
        Text("This is from Team A:" + message)
            .frame(maxWidth: .infinity)
            .padding(32)
            .background(Color.green)
            .border(Color.black)
    }
}

var doSomething: (String) -> PlugItemView = { data in
        return PlugItemView(content: AnyView(ItemRow(message: data)))
    }

