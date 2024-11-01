
import SwiftUI


struct ListItem: Hashable {
    let key: String
    let data: String
}

public struct SocketListView: View {
    public init(items: [(String, String)]) {
        internal_items = items.map { ListItem(key: $0.0, data: $0.1) }
    }
    private var internal_items: [ListItem] = []

    public var body: some View {
        VStack {
            Text("This is List Socket in Design Kit")
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(internal_items, id: \.self) { listItem in
                        PlugItemRegistry.retrieveItem(key: listItem.key)(listItem.data)
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
