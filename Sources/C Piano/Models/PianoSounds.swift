import AVFoundation

struct PianoSoundsModel {
    func setPlayer(sound name: String) -> AVAudioPlayer {
        let sound = Bundle.main.path(forResource: name, ofType: "mp3")
        var audioPlayer = AVAudioPlayer()
        
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL(string: sound!)!)
        } catch {
            print(error)
        }
        
        return audioPlayer
    }
    
    var aPlayer = AVAudioPlayer()
    var sPlayer = AVAudioPlayer()
    var dPlayer = AVAudioPlayer()
    var fPlayer = AVAudioPlayer()
    var gPlayer = AVAudioPlayer()
    var hPlayer = AVAudioPlayer()
    var jPlayer = AVAudioPlayer()
    var kPlayer = AVAudioPlayer()
    var lPlayer = AVAudioPlayer()
    var l1Player = AVAudioPlayer()
    var l2Player = AVAudioPlayer()
    
    var wPlayer = AVAudioPlayer()
    var ePlayer = AVAudioPlayer()
    var tPlayer = AVAudioPlayer()
    var yPlayer = AVAudioPlayer()
    var uPlayer = AVAudioPlayer()
    var oPlayer = AVAudioPlayer()
    var pPlayer = AVAudioPlayer()
    
    init() {
        aPlayer = setPlayer(sound: "C1")
        sPlayer = setPlayer(sound: "D1")
        dPlayer = setPlayer(sound: "E1")
        fPlayer = setPlayer(sound: "F1")
        gPlayer = setPlayer(sound: "G1")
        hPlayer = setPlayer(sound: "A1")
        jPlayer = setPlayer(sound: "B1")
        kPlayer = setPlayer(sound: "C2")
        lPlayer = setPlayer(sound: "D2")
        l1Player = setPlayer(sound: "E2")
        l2Player = setPlayer(sound: "F2")
        
        wPlayer = setPlayer(sound: "CS1")
        ePlayer = setPlayer(sound: "DS1")
        tPlayer = setPlayer(sound: "FS1")
        yPlayer = setPlayer(sound: "GS1")
        uPlayer = setPlayer(sound: "AS1")
        oPlayer = setPlayer(sound: "CS2")
        pPlayer = setPlayer(sound: "DS2")
    }
}
