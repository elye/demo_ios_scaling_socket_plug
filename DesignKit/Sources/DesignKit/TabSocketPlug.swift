
import SwiftUI
import SlidingTabView

public struct SocketTabView : View {
    @State private var tabIndex = 0
    
    public init(items: [(String, String)]) {
        internalItems = items
        tabNames = items.map {
            PlugItemRegistry.retrieveTabScreenTitle(key: $0.0 )}
        print(tabNames)
    }
    private var internalItems: [(String, String)] = []
    private var tabNames: [String] = []
    
    public init() {}
    public var body: some View {
        VStack {
            SlidingTabView(selection: $tabIndex, tabs:tabNames, animation: .easeInOut)
            Spacer()
            let value = internalItems[tabIndex]
            
            PlugItemRegistry.retrieveTabScreen(key: value.0)(value.1)
            Spacer()
        }
    }
}

public struct PlugTabScreenView: View {
    public init(content: AnyView) { Content = content}
    let Content: AnyView
    public var body: some View {
        VStack(alignment: .center) {
            Text("This is from the Tab Screen Plug Template")
            Content
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(16)
            .background(
                Rectangle().fill(Color.blue)
            )
    }
}

struct ErrorPlugTabScreen: View {
    var body: some View {
        Text("ERROR PLUG TAB SCREEN")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
    }
}
