import SwiftUI

public struct BackButton: View {
    @EnvironmentObject var sharedModel: SharedModel
    
    public var body: some View {
        VStack {
            Spacer()
            
            HStack {
                // Prev Button
                Button(action: {
                    withAnimation { sharedModel.page = "" }
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 32))
                        .background(Color.clear)
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle())
                
                // Spacer
                Spacer()
            }
            .padding()
        }
    }
}
