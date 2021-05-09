import AVFoundation

struct BackgroundSounds {
    func setPlayer(sound name: String) -> AVAudioPlayer {
        let sound = Bundle.main.path(forResource: name, ofType: "mp3")
        var audioPlayer = AVAudioPlayer()
        
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL(string: sound!)!)
        } catch {
            print(error)
        }
        
        audioPlayer.numberOfLoops = -1
        
        return audioPlayer
    }
    
    var housePlayer = AVAudioPlayer()
    var workoutPlayer = AVAudioPlayer()
    
    init() {
        housePlayer = setPlayer(sound: "house")
        workoutPlayer = setPlayer(sound: "workout")
    }
}
