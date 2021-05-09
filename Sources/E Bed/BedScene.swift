import SwiftUI

public struct BedScene: View {
    @EnvironmentObject var sharedModel: SharedModel
    @State private var scaleZZZ = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public var body: some View {
        ZStack {
            Image(nsImage: NSImage(named: "wall.jpg")!)
                .resizable()
                .scaledToFill()
            
            VStack {
                Spacer()
                
                Image(nsImage: NSImage(named: "sleep.png")!)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 180)
                    .offset(y: -50)
                    .shadow(color: .black, radius: 200)
            }
            
            Text("💤")
                .scaleEffect(scaleZZZ ? 5 : 3)
                .offset(x: -60, y: -40)
            
            BackButton()
                .frame(width: 800)
        }
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 1).repeatForever()) {
                scaleZZZ.toggle()
            }
        })
        .onReceive(timer) { input in
            sharedModel.updateTraitsInBed()
        }
    }
}

