//
//  AudioHelper.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 10.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import AudioToolbox

struct SoundsForTest{
    static let testing = 1050
    static let picker = 1157
    static let nice = 1057
    static let keyboardWriter = 1100
    static let silentTouch = 1104
    static let middleTouch = 1105
    static let bell = 1111
    static let test = 1120
}

class AudioHelper{
    
    func playAudio(sound: Int){
        if(playSound){
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(sound), nil)
        }
    }
    
}
