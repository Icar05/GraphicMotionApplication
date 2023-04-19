//
//  AudioHelper.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 10.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import AudioToolbox

enum SoundsForTest: Int{
    case testing = 1050
    case picker = 1157
    case nice = 1057
    case keyboardWriter = 1100
    case silentTouch = 1104
    case middleTouch = 1105
    case bell = 1111
    case test = 1120
}

class AudioHelper{
    
    func playAudio(sound: SoundsForTest){
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(sound.rawValue), nil)
    }
    
}
