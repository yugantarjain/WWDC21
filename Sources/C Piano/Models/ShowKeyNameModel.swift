import SwiftUI

public class ShowKeyNamesModel: ObservableObject {
    // White Keys
    @Published public var showForA = true
    @Published public var showForS = true
    @Published public var showForD = true
    @Published public var showForF = true
    @Published public var showForG = true
    @Published public var showForH = true
    @Published public var showForJ = true
    @Published public var showForK = true
    @Published public var showForL = true
    @Published public var showForL1 = true   // l1 = ;
    @Published public var showForL2 = true   // l2 = '
    
    // Black Keys
    @Published public var showForW = true
    @Published public var showForE = true
    @Published public var showForT = true
    @Published public var showForY = true
    @Published public var showForU = true
    @Published public var showForO = true
    @Published public var showForP = true
    
    // Functions
    public func showAllWhiteKeyNames() {
        showForA = true
        showForS = true
        showForD = true
        showForF = true
        showForG = true
        showForH = true
        showForJ = true
        showForK = true
        showForL = true
        showForL1 = true
        showForL2 = true
    }
    
    public func hideAllWhiteKeyNames() {
        showForA = false
        showForS = false
        showForD = false
        showForF = false
        showForG = false
        showForH = false
        showForJ = false
        showForK = false
        showForL = false
        showForL1 = false
        showForL2 = false
    }
    
    public func showAllBlackKeyNames() {
        showForW = true
        showForE = true
        showForT = true
        showForY = true
        showForU = true
        showForO = true
        showForP = true
    }
    
    public func hideAllBlackKeyNames() {
        showForW = false
        showForE = false
        showForT = false
        showForY = false
        showForU = false
        showForO = false
        showForP = false
    }
    
    public init() {
    }
}
