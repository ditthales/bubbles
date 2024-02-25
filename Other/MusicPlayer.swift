//
//  MusicPlayer.swift
//
//
//  Created by ditthales on 25/02/24.
//

import Foundation
import AVFoundation

class MusicPlayer {
    
    static let shared = MusicPlayer()
    var player: AVAudioPlayer?

    func play() {
        let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: .duckOthers)
            if let safeURL = url {
                player = try AVAudioPlayer(contentsOf: safeURL)
                player?.numberOfLoops = -1
                player?.volume = 1
                player?.play()
            }
           
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

