// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


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
}
