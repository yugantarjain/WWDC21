import SwiftUI

public struct PushupHandling: NSViewRepresentable {
    var workoutModel: WorkoutModel
    var sharedModel: SharedModel

    class KeyView: NSView {
        var workoutModel: WorkoutModel
        var sharedModel: SharedModel
        
        init(workoutModel: WorkoutModel, sharedModel: SharedModel) {
            self.workoutModel = workoutModel
            self.sharedModel = sharedModel
            super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override var acceptsFirstResponder: Bool {
            true
        }
        
        override func keyDown(with event: NSEvent) {
            super.keyDown(with: event)
            
            switch event.keyCode {
            case KeyCodeMap.up.rawValue:
                if workoutModel.pushupState == .down {
                    workoutModel.pushupState = .up
                    workoutModel.reps += 1
                    sharedModel.updateTraitsInWorkout()
                }
            case KeyCodeMap.down.rawValue:
                if workoutModel.pushupState == .up {
                    workoutModel.pushupState = .down
                }
            default: break
            }
        }
    }

    public func makeNSView(context: Context) -> NSView {
        let view = KeyView(workoutModel: workoutModel, sharedModel: sharedModel)
        DispatchQueue.main.async { // wait till next event cycle
            view.window?.makeFirstResponder(view)
        }
        return view
    }

    public func updateNSView(_ nsView: NSView, context: Context) {
    }
    
    public init(workoutModel: WorkoutModel, sharedModel: SharedModel) {
        self.workoutModel = workoutModel
        self.sharedModel = sharedModel
    }
}
