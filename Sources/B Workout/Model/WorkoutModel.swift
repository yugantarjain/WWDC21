import SwiftUI

enum PushupState {
    case up, down
}

public class WorkoutModel: ObservableObject {
    @Published var pushupState: PushupState = .up
    @Published var reps = 0
}
