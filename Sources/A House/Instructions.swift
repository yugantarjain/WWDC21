import SwiftUI

struct Instructions: View {
    @EnvironmentObject var sharedModel: SharedModel

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Instructions")
                .font(.system(size: 32, weight: .medium, design: .monospaced))
            
            VStack(alignment: .leading, spacing: 20) {
                Label {
                    Text("Use the Left and Right arrow keys to move across the house.")
                } icon: {
                    Image(systemName: "arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill")
                        .padding()
                }
                
                Label {
                    Text("Use the Return key to interact with the objects including doors, piano, bed, yoga mat, and laptop.")
                } icon: {
                    Image(systemName: "return")
                        .padding()
                }
                
                Label {
                    Text("There are different traits including Tranquility, Fitness, and Productivity for the character.")
                } icon: {
                    Image(systemName: "rectangle.grid.2x2")
                        .padding()
                }
                
                Label {
                    Text("These personal traits keep changing according to your lifestyle and the activities you perform.")
                } icon: {
                    Image(systemName: "person.fill")
                        .padding()
                }
                
                Label {
                    Text("You get 2 minutes and 30 seconds to explore the house and live your life inside it.")
                } icon: {
                    Image(systemName: "timer")
                        .padding()
                }
            }
            
            Button("Let's Start") {
                withAnimation(.linear(duration: 0.5)) {
                    sharedModel.gameState = .gameplay
                }
            }
        }
        .padding(20)
        .font(.system(size: 16, weight: .medium, design: .monospaced))
        .foregroundColor(.primary)
        .imageScale(.large)
    }
}

