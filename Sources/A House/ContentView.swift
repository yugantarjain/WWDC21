import SwiftUI
import SpriteKit
import AVFoundation

public struct ContentView: View {
    @StateObject var sharedModel = SharedModel()
    let backgroundSounds = BackgroundSounds()
        
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
                .onAppear {
                    backgroundSounds.housePlayer.play()
                }
            // Specific Objects Scene
            Group {
                if sharedModel.page == NodeNames.piano {
                    PianoScene()
                } else if sharedModel.page == NodeNames.workTable {
                    MacBookScene()
                } else if sharedModel.page == NodeNames.yogaMat {
                    WorkoutScene()
                        .onAppear {
                            backgroundSounds.workoutPlayer.play()
                        }
                        .onDisappear {
                            backgroundSounds.workoutPlayer.pause()
                        }
                } else if sharedModel.page == NodeNames.bed {
                    BedScene()
                }
            }
            .onAppear {
                backgroundSounds.housePlayer.pause()
            }
            .onDisappear {
                backgroundSounds.housePlayer.play()
            }
            
            // Introduction
            if sharedModel.gameState == .introduction {
                Introduction()
                    .zIndex(1)
            } else if sharedModel.gameState == .over {
                End()
                    .transition(.move(edge: .bottom))
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
