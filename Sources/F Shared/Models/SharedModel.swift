import SwiftUI

public class SharedModel: ObservableObject {
    // To toggle between different pages (piano, macbook ,etc.)
    @Published var page = ""
    
    // Trait values
    var tranquility = 50
    var fitness = 50
    var productivity = 50
    
    // Text used in macbook screen
    @Published var projectReviewText = "Type here"
    
    // Position of person in house scene
    var personPosition = CGPoint(x: 260, y: 140)
}
