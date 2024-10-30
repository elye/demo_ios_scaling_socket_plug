// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import DesignKit

public struct TeamBContentView : View {
    public init() {}
    public var body: some View {
        VStack {
            Text("I am in Team B")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            SocketTabView (
                items: [
                    ("TeamATabPlug1", "Passing Through"),
                    ("TeamBTabPlug", "To our neighbour"),
                    ("TeamATabPlug2", "Passing Through"),
                    ("TeamCTabPlug", "SORRY"),
                ]
            )
        }
    }
}


struct ItemRow: View {
    let message: String
    var body: some View {
        Text(message)
            .frame(maxWidth: .infinity)
            .padding(32)
            .background(Color.yellow)
            .border(Color.black)
    }
}

var singleView: (String) -> PlugItemView = { data in
        return PlugItemView(content: AnyView(ItemRow(message: "This is from Team B:" + data)))
    }

var doubleView: (String) -> PlugItemView = { data in
        return PlugItemView(content: AnyView(
            HStack {
                ItemRow(message: "Team B Here")
                ItemRow(message: data)
            }
        ))
    }

public class RegisterBTeam {
    public static func registerBTeam() {
        PlugItemRegistry.registerItemPlug(key: "TeamBPlug1", function: singleView)
        PlugItemRegistry.registerItemPlug(key: "TeamBPlug2", function: doubleView)
        PlugItemRegistry.registerScreenPlug(key: "TeamBTabPlug", pair: ("Team B", myTabScreen))
    }
}

var myTabScreen: (String) -> PlugTabScreenView = { data in
    return PlugTabScreenView(content: AnyView(
        VStack {
            ItemRow(message: "Add something on top")
            HStack {
                ItemRow(message: "Team B Here")
                ItemRow(message: data)
            }
        }
    ))
}
