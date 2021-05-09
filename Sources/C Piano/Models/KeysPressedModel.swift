import SwiftUI

public class KeysPressedModel: ObservableObject {
    // White Keys
    @Published public var aPressed = false
    @Published public var sPressed = false
    @Published public var dPressed = false
    @Published public var fPressed = false
    @Published public var gPressed = false
    @Published public var hPressed = false
    @Published public var jPressed = false
    @Published public var kPressed = false
    @Published public var lPressed = false
    @Published public var l1Pressed = false   // l1 = ;
    @Published public var l2Pressed = false   // l2 = '
    
    // Black Keys
    @Published public var wPressed = false
    @Published public var ePressed = false
    @Published public var tPressed = false
    @Published public var yPressed = false
    @Published public var uPressed = false
    @Published public var oPressed = false
    @Published public var pPressed = false
    
    // Chord Pressed
    @Published public var chordPressed =  ""
    
    // Sustain
    @Published public var sustain = true
    
    // init
    public init() {
    }
}
