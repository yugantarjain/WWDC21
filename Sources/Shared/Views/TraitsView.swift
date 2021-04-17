import SwiftUI

public struct TraitsView: View {
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
            
            HStack {
                TraitBar(name: "Tranquility", colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))], progress: 50)

                Spacer()
                
                TraitBar(name: "Fitness", colors: [Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))], progress: 50)
                
                Spacer()
                
                TraitBar(name: "Productivity", colors: [Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))], progress: 50)
            }
            .padding(.horizontal)
        }
    }
}

