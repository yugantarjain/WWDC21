import AVFoundation

extension AVAudioPlayer {
    func reset(sustain: Bool) {
        if !sustain {
            self.pause()
        }
    }
    
    func start() {
        self.currentTime = 0
        self.play()
    }
}
