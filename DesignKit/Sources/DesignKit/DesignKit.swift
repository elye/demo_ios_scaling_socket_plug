// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SocketListView: View {
    public init(items: [(String, String)]) { internal_items = items}
    
    var internal_items: [(String, String)] = []
    
    let columns = [GridItem(.flexible())]


    public var body: some View {
        Text("This is List Socket in Design Kit")
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(internal_items, id: \.0) { (key, data) in
                    PlugItemRegistry.retrieve(key: key)(data)
                }
            }
        }
    }
}

public struct PlugItemView: View {
    public init(content: AnyView) { Content = content}
    let Content: AnyView
    public var body: some View {
        Content
    }
}

public class PlugItemRegistry {
    static var plugItemDict: [String: ((String) -> PlugItemView)] = [:]
    
    public static func register(key: String, function: @escaping ((String) -> PlugItemView)) {
        plugItemDict[key] = function
    }
    
    public static func retrieve(key: String) -> ((String) -> PlugItemView) {
        return plugItemDict[key] ?? defaultErrorPlugItem
    }
    
    static let defaultErrorPlugItem: (String) -> PlugItemView = { _ in
        return PlugItemView(content: AnyView(Text("ERROR PLUG ITEM")))
    }

}

