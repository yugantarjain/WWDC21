import SwiftUI

struct Introduction: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State private var showingInstructions = false

    var body: some View {
        ZStack {
            Color.black
                .opacity(showingInstructions ? 0.8 : 1.0)
            
            if showingInstructions {
                Instructions()
            } else {
                Text("Life Inside A House ")
                    .font(.system(size: 72, weight: .medium, design: .monospaced))
                    .zIndex(1)
            }
        }
        .frame(width: Layout.width, height: Layout.height)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.linear(duration: 1)) {
                    showingInstructions = true
                }
            }
        }
    }
}
