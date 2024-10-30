// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct PlugItemView: View {
    public init(content: AnyView) { Content = content}
    let Content: AnyView
    public var body: some View {
        Content
    }
}
