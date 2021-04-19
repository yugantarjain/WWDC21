import SwiftUI

struct Introduction: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State private var showingInstructions = false
    @State private var showingConcept = false
    
    let concept = "With the ongoing global health situation, we have been spending a lot of our time in our houses and our rooms.\n\n\nThis project (Life Inside a House) tries to simulate that reality in a game environment.\n\n\nThere's no definite way to play the game, it is up to you. Through this project you can have fun, introspect, experiment, and even learn a few new things."

    var body: some View {
        ZStack {
            Color(.textBackgroundColor)
                .opacity(showingInstructions == showingConcept ? 1.0 : 0.9)
            
            if showingInstructions {
                Instructions()
            } else {
                VStack(spacing: 40) {
                    Text("Life Inside a House")
                        .font(.system(size: showingConcept ? 32 : 72, weight: .medium, design: .monospaced))
                        .opacity(showingInstructions ? 0 : 1)
                        .zIndex(1)
                    
                    if showingConcept {
                        Text(concept)
                            .padding(40)
                        
                        Button("Continue") {
                            withAnimation(.linear(duration: 0.5)) {
                                showingConcept = false
                                showingInstructions = true
                            }
                        }
                    }
                }
                .font(.system(size: 16, weight: .medium, design: .monospaced))
            }
        }
        .frame(width: Layout.width, height: Layout.height)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.linear(duration: 0.75)) {
                    showingConcept = true
                }
            }
        }
    }
}
