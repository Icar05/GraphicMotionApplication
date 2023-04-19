//
//  RandomUpdater.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import Foundation

public final class RandomUpdater{
    
    
    
    private let interval =  0.5
    
    private let numbers = [1,4,2,4,3,4,4,6,5,7,6,8,7,8,8,7,9,10]
    
    private var timer: Timer?
    
    var delegate: ((Int) -> Void)? = nil
    
    
    public func start(){
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            self?.generateUpdate()
        }
    }
    
    
    public func stop(){
        self.timer?.invalidate()
    }
    
    
    private func generateUpdate(){
        let randomNumber = Int.random(in: 1...self.numbers.max()!)
        self.delegate?(randomNumber)
    }
}
