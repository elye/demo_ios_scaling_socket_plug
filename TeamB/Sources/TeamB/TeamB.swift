// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import DesignKit

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
        PlugItemRegistry.register(key: "TeamBPlug1", function: singleView)
        PlugItemRegistry.register(key: "TeamBPlug2", function: doubleView)
    }
}
