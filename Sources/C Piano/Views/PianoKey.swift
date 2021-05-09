import SwiftUI

// White Piano Key View
public struct PianoKey: View {
    var isPressed: Bool
    var keyboardMappedKey: String
    var showKeyName: Bool
    var keyName: String
    
    var whiteKey: Bool {
        return keyName.count == 1
    }
    
    public init(isPressed: Bool, keyboardMappedKey: String, showKeyName: Bool, keyName: String) {
        self.isPressed = isPressed
        self.keyboardMappedKey = keyboardMappedKey
        self.showKeyName = showKeyName
        self.keyName = keyName
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            if whiteKey {
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(isPressed ? Color(.lightGray) : .white)
            } else {
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(isPressed ? .gray : .black)
            }
                
            Text(keyboardMappedKey)
                .foregroundColor(whiteKey ? .black : .white)
                .font(.headline)
                .padding(10)
            
            if showKeyName {
                Text(keyName)
                    .offset(x: 0, y: whiteKey ? 40 : -60)
                    .foregroundColor(.white)
                    .padding(10)
            }
        }
        .frame(width: 48, height: whiteKey ? 100 : 55)
    }
}
