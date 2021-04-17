import SwiftUI

public class SharedModel: ObservableObject {
    // To toggle between different pages (piano, macbook ,etc.)
    @Published public var page = ""
    
    // Text used in macbook screen
    @Published public var projectReviewText = "Type here"
    
    // Position of person in house scene
    var personPosition = CGPoint(x: 260, y: 140)
}
