import SwiftUI

public struct PianoScene: View {
    @StateObject var keysPressed = KeysPressedModel()
    @StateObject var showKeyNamesModel = ShowKeyNamesModel()
    
    @State private var showKeyNames = true
    
    public var body: some View {
        ZStack {
            Image(nsImage: NSImage(named: "wall.jpg")!)
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
                .frame(width: 610, height: 300, alignment: .center)
                .cornerRadius(8)
                .padding()
                .shadow(color: .white, radius: 10)
            
            VStack(spacing: 64) {
                HStack(alignment: .top) {
                    Text("Chord: \(keysPressed.chordPressed)")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(height: 50)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Toggle("Show Key Names", isOn: $showKeyNames)
                            .toggleStyle(SwitchToggleStyle())
                        
                        Toggle("Sustain", isOn: $keysPressed.sustain)
                            .toggleStyle(SwitchToggleStyle())
                    }
                    .foregroundColor(.white)
                }
                .frame(width: 560)
                .offset(x: 0, y: -16)
                
                PianoView(keysPressed: keysPressed, showKeyNames: showKeyNamesModel)
            }
            
            BackButton()
                .frame(width: 800)
        }
        .onChange(of: showKeyNames) { show in
            if show {
                showKeyNamesModel.showAllWhiteKeyNames()
                showKeyNamesModel.showAllBlackKeyNames()
            } else {
                showKeyNamesModel.hideAllWhiteKeyNames()
                showKeyNamesModel.hideAllBlackKeyNames()
            }
        }
    }
}

