import SwiftUI

public struct PianoView: View {
    @ObservedObject var keysPressed: KeysPressedModel
    @ObservedObject var showKeyNames: ShowKeyNamesModel
        
    public var body: some View {
        ZStack(alignment: .topLeading) {
            // White Keys Layout
            HStack(spacing: 4) {
                Group {
                    PianoKey(isPressed: keysPressed.aPressed, keyboardMappedKey: "A", showKeyName: showKeyNames.showForA, keyName: "C")
                    PianoKey(isPressed: keysPressed.sPressed, keyboardMappedKey: "S", showKeyName: showKeyNames.showForS, keyName: "D")
                    PianoKey(isPressed: keysPressed.dPressed, keyboardMappedKey: "D", showKeyName: showKeyNames.showForD, keyName: "E")
                    PianoKey(isPressed: keysPressed.fPressed, keyboardMappedKey: "F", showKeyName: showKeyNames.showForF, keyName: "F")
                    PianoKey(isPressed: keysPressed.gPressed, keyboardMappedKey: "G", showKeyName: showKeyNames.showForG, keyName: "G")
                }
                
                Group {
                    PianoKey(isPressed: keysPressed.hPressed, keyboardMappedKey: "H", showKeyName: showKeyNames.showForH, keyName: "A")
                    PianoKey(isPressed: keysPressed.jPressed, keyboardMappedKey: "J", showKeyName: showKeyNames.showForJ, keyName: "B")
                    PianoKey(isPressed: keysPressed.kPressed, keyboardMappedKey: "K", showKeyName: showKeyNames.showForK, keyName: "C")
                    PianoKey(isPressed: keysPressed.lPressed, keyboardMappedKey: "L", showKeyName: showKeyNames.showForL, keyName: "D")
                    PianoKey(isPressed: keysPressed.l1Pressed, keyboardMappedKey: ";", showKeyName: showKeyNames.showForL1, keyName: "E")
                    PianoKey(isPressed: keysPressed.l2Pressed, keyboardMappedKey: "'", showKeyName: showKeyNames.showForL2, keyName: "F")
                }
            }
            
            // Black Keys Layout
            HStack(spacing: 4) {
                Group {
                    PianoKey(isPressed: keysPressed.wPressed, keyboardMappedKey: "W", showKeyName: showKeyNames.showForW, keyName: "C#\nDb")
                    PianoKey(isPressed: keysPressed.ePressed, keyboardMappedKey: "E", showKeyName: showKeyNames.showForE, keyName: "D#\nEb")
                }
                .offset(x: 24)
                
                Group {
                    PianoKey(isPressed: keysPressed.tPressed, keyboardMappedKey: "T", showKeyName: showKeyNames.showForT, keyName: "F#\nGb")
                    PianoKey(isPressed: keysPressed.yPressed, keyboardMappedKey: "Y", showKeyName: showKeyNames.showForY, keyName: "G#\nAb")
                    PianoKey(isPressed: keysPressed.uPressed, keyboardMappedKey: "U", showKeyName: showKeyNames.showForU, keyName: "A#\nBb")
                }
                .offset(x: 24 + 48)
                
                Group {
                    PianoKey(isPressed: keysPressed.oPressed, keyboardMappedKey: "O", showKeyName: showKeyNames.showForO, keyName: "C#\nDb")
                    PianoKey(isPressed: keysPressed.pPressed, keyboardMappedKey: "P", showKeyName: showKeyNames.showForP, keyName: "D#\nEb")
                }
                .offset(x: 24 + 48 + 48)
            }
        }
        .background(KeyEventHandling(keysPressed: keysPressed, showKeyNames: showKeyNames))
    }
}
