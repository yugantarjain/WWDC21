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
                Spacer()
                
                Text("Reps: \(workoutModel.reps)")
            }
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .black, design: .monospaced))
            .padding(40)
            .offset(y: -50)
            .frame(width: Layout.width)
            
            BackButton()
                .frame(width: 800)
        }
        .background(PushupHandling(workoutModel: workoutModel, sharedModel: sharedModel))
    }
}

