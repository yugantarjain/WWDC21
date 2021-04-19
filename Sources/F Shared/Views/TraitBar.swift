import SwiftUI

struct TraitBar: View {
    var name: String
    var colors: [Color]
    var progress: CGFloat
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing)
    }
    
    var body: some View {
        HStack {
            Text("\(name)")
                .font(.headline)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .opacity(0.5)
                    .frame(width: 100, height: 20)
                
                ZStack(alignment: .trailing) {
                    Capsule()
                        .fill(gradient)
                        .frame(width: progress, height: 20)
                    
                    Text("\(Int(progress))")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(4)
                }
            }
        }
    }
}
