import SwiftUI

public class SharedModel: ObservableObject {
    // To toggle between different pages (piano, macbook ,etc.)
    @Published var page = ""
    
    // Text used in macbook screen
    @Published var projectReviewText = "Type here"
    
    // Position of person in house scene
    var personPosition = CGPoint(x: 260, y: 140)
    
    // Trait values
    var tranquility: CGFloat = 50
    var fitness: CGFloat = 50
    var productivity: CGFloat = 50
    
    // Trait updation methods
    func updateTraitsInPiano() {
        // Updated per piano key pressed
        tranquility += 0.25
        productivity += 0.25
    }
    
    func updateTraitsInWorkout() {
        // Updated with each rep
        fitness += 1
        productivity += 0.25
        tranquility += 0.25
    }
    
    func updateTraitsInMacBook(textCount: inout Int) {
        // Updated in constant time intervals, according to amount of text changed
        let newTextCount = projectReviewText.count
        let difference = abs(newTextCount - textCount)
        textCount = newTextCount
        productivity += CGFloat(sqrt(Double(difference)) / 2)
        
        // Updated solely with time interval
        fitness -= 0.025
        tranquility -= 0.025
    }
    
    func updateTraitsInBed() {
        // Updated in constant time intervals
        tranquility += 1
        fitness += 0.25
    }
}
