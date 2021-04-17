import SwiftUI
import Combine
import AVFoundation

public struct KeyEventHandling: NSViewRepresentable {
    var keysPressed: KeysPressedModel
    var showKeyNames: ShowKeyNamesModel

    class KeyView: NSView {
        var keysPressed: KeysPressedModel
        var showKeyNames: ShowKeyNamesModel
        var pianoSounds = PianoSoundsModel()
        var keysPressedCount: Int!
        
        func identifyChord( ) {
            guard keysPressedCount == 3 else {
                keysPressed.chordPressed = ""
                return
            }
            
            if keysPressed.aPressed && keysPressed.dPressed && keysPressed.gPressed {
                keysPressed.chordPressed = "C"
            } else if keysPressed.fPressed && keysPressed.hPressed && keysPressed.kPressed {
                keysPressed.chordPressed = "F"
            } else if keysPressed.gPressed && keysPressed.jPressed && keysPressed.lPressed {
                keysPressed.chordPressed = "G"
            } else if keysPressed.hPressed && keysPressed.kPressed && keysPressed.l1Pressed {
                keysPressed.chordPressed = "A Minor"
            } else {
                keysPressed.chordPressed = ""
            }
        }
        
        init(keysPressed: KeysPressedModel, showKeyNames: ShowKeyNamesModel) {
            keysPressedCount = 0
            self.keysPressed = keysPressed
            self.showKeyNames = showKeyNames
            super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var acceptsFirstResponder: Bool {
            true
        }
        
        override func keyDown(with event: NSEvent) {
            super.keyDown(with: event)
            
            keysPressedCount += 1
            
            if let key = event.charactersIgnoringModifiers {
                switch key {
                case "w": keysPressed.wPressed = true; pianoSounds.wPlayer.start()
                case "e": keysPressed.ePressed = true; pianoSounds.ePlayer.start()
                case "t": keysPressed.tPressed = true; pianoSounds.tPlayer.start()
                case "y": keysPressed.yPressed = true; pianoSounds.yPlayer.start()
                case "u": keysPressed.uPressed = true; pianoSounds.uPlayer.start()
                case "o": keysPressed.oPressed = true; pianoSounds.oPlayer.start()
                case "p": keysPressed.pPressed = true; pianoSounds.pPlayer.start()
                case "a": keysPressed.aPressed = true; pianoSounds.aPlayer.start()
                case "s": keysPressed.sPressed = true; pianoSounds.sPlayer.start()
                case "d": keysPressed.dPressed = true; pianoSounds.dPlayer.start()
                case "f": keysPressed.fPressed = true; pianoSounds.fPlayer.start()
                case "g": keysPressed.gPressed = true; pianoSounds.gPlayer.start()
                case "h": keysPressed.hPressed = true; pianoSounds.hPlayer.start()
                case "j": keysPressed.jPressed = true; pianoSounds.jPlayer.start()
                case "k": keysPressed.kPressed = true; pianoSounds.kPlayer.start()
                case "l": keysPressed.lPressed = true; pianoSounds.lPlayer.start()
                case ";": keysPressed.l1Pressed = true; pianoSounds.l1Player.start()
                case "'": keysPressed.l2Pressed = true; pianoSounds.l2Player.start()
                default: break
                }
            }
            
            identifyChord()
        }
        
        override func keyUp(with event: NSEvent) {
            super.keyUp(with: event)
            
            keysPressedCount -= 1
            if keysPressedCount < 0 { keysPressedCount = 0 }
            
            if let key = event.charactersIgnoringModifiers {
                switch key {
                case "w": keysPressed.wPressed = false; pianoSounds.wPlayer.reset(sustain: keysPressed.sustain)
                case "e": keysPressed.ePressed = false; pianoSounds.ePlayer.reset(sustain: keysPressed.sustain)
                case "t": keysPressed.tPressed = false; pianoSounds.tPlayer.reset(sustain: keysPressed.sustain)
                case "y": keysPressed.yPressed = false; pianoSounds.yPlayer.reset(sustain: keysPressed.sustain)
                case "u": keysPressed.uPressed = false; pianoSounds.uPlayer.reset(sustain: keysPressed.sustain)
                case "o": keysPressed.oPressed = false; pianoSounds.oPlayer.reset(sustain: keysPressed.sustain)
                case "p": keysPressed.pPressed = false; pianoSounds.pPlayer.reset(sustain: keysPressed.sustain)
                case "a": keysPressed.aPressed = false; pianoSounds.aPlayer.reset(sustain: keysPressed.sustain)
                case "s": keysPressed.sPressed = false; pianoSounds.sPlayer.reset(sustain: keysPressed.sustain)
                case "d": keysPressed.dPressed = false; pianoSounds.dPlayer.reset(sustain: keysPressed.sustain)
                case "f": keysPressed.fPressed = false; pianoSounds.fPlayer.reset(sustain: keysPressed.sustain)
                case "g": keysPressed.gPressed = false; pianoSounds.gPlayer.reset(sustain: keysPressed.sustain)
                case "h": keysPressed.hPressed = false; pianoSounds.hPlayer.reset(sustain: keysPressed.sustain)
                case "j": keysPressed.jPressed = false; pianoSounds.jPlayer.reset(sustain: keysPressed.sustain)
                case "k": keysPressed.kPressed = false; pianoSounds.kPlayer.reset(sustain: keysPressed.sustain)
                case "l": keysPressed.lPressed = false; pianoSounds.lPlayer.reset(sustain: keysPressed.sustain)
                case ";": keysPressed.l1Pressed = false; pianoSounds.l1Player.reset(sustain: keysPressed.sustain)
                case "'": keysPressed.l2Pressed = false; pianoSounds.l2Player.reset(sustain: keysPressed.sustain)
                default: break
                }
            }
            
            identifyChord()
        }
    }

    public func makeNSView(context: Context) -> NSView {
        let view = KeyView(keysPressed: keysPressed, showKeyNames: showKeyNames)
        DispatchQueue.main.async { // wait till next event cycle
            view.window?.makeFirstResponder(view)
        }
        return view
    }

    public func updateNSView(_ nsView: NSView, context: Context) {
    }
    
    public init(keysPressed: KeysPressedModel, showKeyNames: ShowKeyNamesModel) {
        self.keysPressed = keysPressed
        self.showKeyNames = showKeyNames
    }
}
