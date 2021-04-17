import SwiftUI

struct Screen: View {
    @EnvironmentObject var sharedModel: SharedModel
    
    var body: some View {
        ZStack {
            Color(NSColor.textBackgroundColor)
            
            VStack {
                Text("Project Review")
                    .font(.title)
                
                TextEditor(text: $sharedModel.projectReviewText)
            }
        }
    }
}

