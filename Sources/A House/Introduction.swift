import SwiftUI

struct Introduction: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State private var showingInstructions = false

    var body: some View {
        ZStack {
            Color(.textBackgroundColor)
                .opacity(showingInstructions ? 0.9 : 1.0)
            
            if showingInstructions {
                Instructions()
            } else {
                Text("Life Inside a House")
                    .font(.system(size: 72, weight: .medium, design: .monospaced))
                    .opacity(showingInstructions ? 0 : 1)
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
