import SwiftUI

public struct MacBookScene: View {
    public var body: some View {
        ZStack {
            Image(nsImage: NSImage(named: "wall.jpg")!)
                .resizable()
                .scaledToFill()
            
            VStack {
                Spacer()
                
                Image(nsImage: NSImage(named: "table.png")!)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 180)
                    .shadow(color: .white, radius: 200)
            }
            
            Image(nsImage: NSImage(named: "macbook.png")!)
                .resizable()
                .scaleEffect(CGSize(width: 0.35, height: 0.4))
                .offset(x: 0, y: 20)
            
            Screen()
                .frame(width: 250, height: 150, alignment: .center)
                .offset(x: 0, y: -15)
            
            BackButton()
                .frame(width: 800)
        }
    }
}
