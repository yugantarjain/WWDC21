import SwiftUI
import SpriteKit

public struct WorkoutScene: View {
    @StateObject var workoutModel = WorkoutModel()
    @EnvironmentObject var sharedModel: SharedModel
    
    public var body: some View {
        ZStack {
            Image(nsImage: NSImage(named: "wall.jpg")!)
                .resizable()
                .scaledToFill()
            
            Image(nsImage: NSImage(named: "windowDown.png")!)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.55)
                .offset(x: 0, y: -140)
            
            VStack {
                Spacer()
                
                Image(nsImage: NSImage(named: "yogaMat.png")!)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 160)
                    .offset(x: 0, y: -40)
                    .shadow(color: .white, radius: 200)
            }
            
            Image(nsImage: NSImage(named: workoutModel.pushupState == .up ? "pushupUp" : "pushupDown")!)
                .scaleEffect(x: 0.5, y: 0.5)
                .offset(y: workoutModel.pushupState == .up ? 160 : 170)
            
            HStack {
                if workoutModel.reps == 0 {
                    switch workoutModel.pushupState {
                    case .up: Label("Use the Down arrow key to go down", systemImage: "arrowtriangle.down.square.fill")
                    case .down: Label("Use the Up arrow key to push back up", systemImage: "arrowtriangle.up.square.fill")
                    }
                } else {
                    Text("Reps: \(workoutModel.reps)")
                    
                    Spacer()
                }
            }
            .font(.system(size: 32, weight: .black, design: .monospaced))
            .foregroundColor(.white)
            .padding()
            .offset(y: 10)
            .frame(width: Layout.width)
            
            BackButton()
                .frame(width: 800)
        }
        .background(PushupHandling(workoutModel: workoutModel, sharedModel: sharedModel))
    }
}

