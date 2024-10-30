// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SocketListView: View {
    public init(items: [(String, String)]) { internal_items = items}
    var internal_items: [(String, String)] = []
    let columns = [GridItem(.flexible())]

    public var body: some View {
        VStack {
            Text("This is List Socket in Design Kit")
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(internal_items, id: \.0) { (key, data) in
                        PlugItemRegistry.retrieve(key: key)(data)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(16)
            .background(
                Rectangle().fill(Color.gray)
            )
    }
}

public struct PlugItemView: View {
    public init(content: AnyView) { Content = content}
    let Content: AnyView
    public var body: some View {
        VStack(alignment: .center) {
            Text("This is from the Plug Item Template")
            Content
        }.frame(maxWidth: .infinity)
            .padding(16)
            .background(
                Rectangle().fill(Color.blue)
            )
    }
}

public class PlugItemRegistry {
    static var plugItemDict: [String: ((String) -> PlugItemView)] = [:]
    
    public static func register(key: String, function: @escaping ((String) -> PlugItemView)) {
        plugItemDict[key] = function
    }
    
    static func retrieve(key: String) -> ((String) -> PlugItemView) {
        return plugItemDict[key] ?? defaultErrorPlugItem
    }
    
    static let defaultErrorPlugItem: (String) -> PlugItemView = { _ in
        return PlugItemView(content: AnyView(ErrorPlugItem()))
    }

    struct ErrorPlugItem: View {
        var body: some View {
            Text("ERROR PLUG ITEM")
                .frame(maxWidth: .infinity)
                .background(Color.red)
        }
    }
}
