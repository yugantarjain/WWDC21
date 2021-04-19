import SwiftUI

struct End: View {
    @EnvironmentObject var sharedModel: SharedModel
    
    func differenceWithSign(number1: CGFloat, number2: Int = 50) -> String {
        let number1 = Int(number1)
        if number1 >= number2 {
            return "+\(number1 - number2)"
        } else {
            return "\(number1-number2)"
        }
    }

    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
            
            VStack(alignment: .center, spacing: 80) {
                Text("Time Over!")
                    .font(.system(size: 64, weight: .heavy, design: .monospaced))
                                
                VStack(spacing: 50) {
                    Text("Your traits have changed in the following manner:")
                        .font(.largeTitle)

                    Label {
                        Text(differenceWithSign(number1: sharedModel.tranquility))
                    } icon: {
                        TraitBar(name: "Tranquility", colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))], progress: sharedModel.tranquility)
                            .scaleEffect(1.2)
                            .frame(width: 250)
                    }
                    
                    Label {
                        Text(differenceWithSign(number1: sharedModel.fitness))
                    } icon: {
                        TraitBar(name: "Fitness", colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))], progress: sharedModel.fitness)
                            .scaleEffect(1.2)
                            .frame(width: 250)
                    }
                    
                    Label {
                        Text(differenceWithSign(number1: sharedModel.productivity))
                    } icon: {
                        TraitBar(name: "Productivity", colors: [Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))], progress: sharedModel.productivity)
                            .scaleEffect(1.2)
                            .frame(width: 250)
                    }
                }
                .font(.system(size: 16, weight: .medium, design: .monospaced))
            }
            .foregroundColor(.white)
        }
    }
}

