// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import DesignKit

struct ItemRow: View {
    let message: String
    var body: some View {
        Text("This is from Team B:" + message)
    }
}

var doSomething: (String) -> PlugItemView = { data in
        return PlugItemView(content: AnyView(ItemRow(message: data)))
    }

public class RegisterBTeam {
    public static func registerBTeam() {
        PlugItemRegistry.register(key: "TeamBPlug", function: doSomething)
    }
}
