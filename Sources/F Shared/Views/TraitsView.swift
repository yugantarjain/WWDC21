import SwiftUI

public struct TraitsView: View {
    @EnvironmentObject var sharedModel: SharedModel
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State @Clamping(0...150) private var totalTime = 150
    
    var seconds: Int {
        return totalTime % 60
    }
    var minutes: Int {
        return totalTime / 60
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
            
            HStack {
                Text("\(minutes):\(seconds, specifier: "%02d")")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))

                Spacer()
                
                TraitBar(name: "Tranquility", colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))], progress: sharedModel.tranquility)

                Spacer()
                
                TraitBar(name: "Fitness", colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))], progress: sharedModel.fitness)
                
                Spacer()
                
                TraitBar(name: "Productivity", colors: [Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))], progress: sharedModel.productivity)
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
        .onReceive(timer) { input in
            totalTime -= 1
            
            if totalTime % 3 == 0 && sharedModel.page == "" {
                sharedModel.tranquility -= 1
                sharedModel.fitness -= 1
                sharedModel.productivity -= 1
            }
        }
    }
}

