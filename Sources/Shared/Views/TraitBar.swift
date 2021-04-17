import SwiftUI

struct TraitBar: View {
    var name: String
    var colors: [Color]
    var progress: Int
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing)
    }
    
    var body: some View {
        HStack {
            Text("\(name)")
                .font(.headline)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 100, height: 20)
                
                ZStack(alignment: .trailing) {
                    Capsule()
                        .fill(gradient)
                        .frame(width: CGFloat(progress), height: 20)
                    
                    Text("\(progress)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(4)
                }
            }
        }
    }
}
