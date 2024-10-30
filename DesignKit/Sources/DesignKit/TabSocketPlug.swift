
import SwiftUI
import SlidingTabView

public struct TeamBContentView : View {
    @State private var tabIndex = 0
    public init() {}
    public var body: some View {
        VStack {
            SlidingTabView(selection: $tabIndex, tabs:["Home", "Friends", "Settings"], animation: .easeInOut)
            Spacer()
            if tabIndex == 0 {
                Text("Home")
            } else if tabIndex == 1 {
                Text("Friends")
            } else if tabIndex == 2 {
                Text("Settings")
            }
            Spacer()
        }
    }
}
