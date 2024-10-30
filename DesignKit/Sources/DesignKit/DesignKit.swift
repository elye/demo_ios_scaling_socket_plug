// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


public class PlugItemRegistry {
    static var plugItemDict: [String: ((String) -> PlugItemView)] = [:]
    static var plugScreenDict: [String: (String, (String) -> PlugTabScreenView)] = [:]
    
    public static func registerItemPlug(key: String, function: @escaping ((String) -> PlugItemView)) {
        plugItemDict[key] = function
    }

    public static func registerScreenPlug(key: String, pair: (String, ((String) -> PlugTabScreenView))) {
        plugScreenDict[key] = pair
    }

    static func retrieveTabScreenTitle(key: String) -> String {
        return plugScreenDict[key]?.0 ?? "ERROR"
    }

    static func retrieveTabScreen(key: String) -> ((String) -> PlugTabScreenView) {
        return plugScreenDict[key]?.1 ?? defaultErrorPlugTabScreen
    }

    static func retrieveItem(key: String) -> ((String) -> PlugItemView) {
        return plugItemDict[key] ?? defaultErrorPlugItem
    }


    static let defaultErrorPlugItem: (String) -> PlugItemView = { _ in
        return PlugItemView(content: AnyView(ErrorPlugItem()))
    }
    
    static let defaultErrorPlugTabScreen: (String) -> PlugTabScreenView = { _ in
        return PlugTabScreenView(content: AnyView(ErrorPlugTabScreen()))
    }
}
