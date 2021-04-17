import SwiftUI
import SpriteKit

public struct WorkoutScene: View {
    @StateObject var workoutModel = WorkoutModel()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var totalTime = 0
    var seconds: Int {
        return totalTime % 60
    }
    var minutes: Int {
        return totalTime / 60
    }
    
    
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
                Text("\(minutes):\(seconds, specifier: "%02d")")
                
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
        .onReceive(timer) { input in
            totalTime += 1
        }
        .background(PushupHandling(workoutModel: workoutModel))
    }
}

