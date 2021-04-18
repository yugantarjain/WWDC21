import SwiftUI

struct Introduction: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State private var showingInstructions = true

    var body: some View {
        ZStack {
            Color.black
                .opacity(showingInstructions ? 0.8 : 1.0)
            
            if showingInstructions {
                Instructions()
            }
        }
        .frame(width: Layout.width, height: Layout.height)
    }
}
