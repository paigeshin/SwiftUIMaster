//
//  PlaySound.swift
//  Honeymoon
//
//  Created by paige on 2021/09/22.
//

import AVFoundation

var audioPlyaer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlyaer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlyaer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
