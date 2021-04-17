import SwiftUI

struct Screen: View {
    @EnvironmentObject var model: SharedModel
    
    var body: some View {
        ZStack {
            Color(NSColor.textBackgroundColor)
            
            VStack {
                Text("Project Review")
                    .font(.title)
                
                TextEditor(text: $model.projectReviewText)
            }
        }
    }
}

