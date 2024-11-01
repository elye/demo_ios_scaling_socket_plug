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
            MySocketList()
        }
    }
}

public class RegisterATeam {
    public static func registerATeam() {
        PlugItemRegistry.registerItemPlug(key: "TeamAPlug", function: doSomething)
        PlugItemRegistry.registerScreenPlug(key: "TeamATabPlug1", pair: ("A Tab 1", myTabScreen))
        PlugItemRegistry.registerScreenPlug(key: "TeamATabPlug2", pair: ("A Tab 2", myTabScreenList))

    }
}

struct MySocketList: View {
    var body: some View {
        SocketListView(
            items: [
                ("TeamAPlug", "Passing Through"),
                ("TeamBPlug1", "To our neighbour"),
                ("TeamBPlug1", "THere to"),
                ("TeamBPlug2", "Smaller one"),
                ("TeamAPlug", "Passing Through"),
                ("TeamBPlug1", "To our neighbour"),
                ("TeamCPlug", "SORRY"),
            ]
        )
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

var myTabScreen: (String) -> PlugTabScreenView = { data in
    return PlugTabScreenView(content: AnyView(
        ItemRow(message: "Team A Here")
    ))
}

var myTabScreenList: (String) -> PlugTabScreenView = { data in
    return PlugTabScreenView(content: AnyView(
        MySocketList()
    ))
}

