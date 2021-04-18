import SwiftUI
import SpriteKit

public struct ContentView: View {
    @StateObject var sharedModel = SharedModel()
        
    var scene: HouseSKScene {
        let scene = HouseSKScene()
        scene.sharedModel = sharedModel
        scene.size = CGSize(width: Layout.width, height: Layout.height)
        scene.scaleMode = .fill
        return scene
    }
    
    public var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.06989355385, green: 0.6409825087, blue: 0.9341161847, alpha: 1))
            
            // House Scene
            SpriteView(scene: scene)
                .frame(width: Layout.width, height: Layout.height)
                .offset(y: 20)
                .ignoresSafeArea()
            
            // Specific Objects Scene
            if sharedModel.page == NodeNames.piano {
                PianoScene()
            } else if sharedModel.page == NodeNames.workTable {
                MacBookScene()
            } else if sharedModel.page == NodeNames.yogaMat {
                WorkoutScene()
            } else if sharedModel.page == NodeNames.bed {
                BedScene()
            }
            
            // Introduction
            if sharedModel.gameState == .introduction {
                Introduction()
                    .zIndex(1)
            }
            
            // Traits and Timer view
            if sharedModel.gameState == .gameplay {
                VStack {
                    TraitsView()
                        .frame(width: Layout.width, height: 40)
                    
                    Spacer()
                }
            }
        }
        .environmentObject(sharedModel)
    }
    
    public init() { }
}
