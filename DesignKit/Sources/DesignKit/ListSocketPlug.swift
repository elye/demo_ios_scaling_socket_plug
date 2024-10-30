
import SwiftUI


public struct SocketListView: View {
    public init(items: [(String, String)]) { internal_items = items}
    private var internal_items: [(String, String)] = []

    public var body: some View {
        VStack {
            Text("This is List Socket in Design Kit")
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(internal_items, id: \.0) { (key, data) in
                        PlugItemRegistry.retrieveItem(key: key)(data)
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

struct ErrorPlugItem: View {
    var body: some View {
        Text("ERROR PLUG ITEM")
            .frame(maxWidth: .infinity)
            .background(Color.red)
    }
}
