//
//  DataProvider.swift
//  GraphicMotionApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/10.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift
import CoreMotion

class DataProvider: Provider{
    
    
    

    
    var bag = DisposeBag()
    
    var motionManager: CMMotionManager!
    
    var subject: PublishSubject = PublishSubject<Int>()
    
    
    
    init(){
        motionManager = CMMotionManager()
    }
    
    
    
    func startUpdates(){
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {
            (accelerData:CMAccelerometerData?, error: Error?) in
            
            if (error != nil ) {
                self.subject.onError(error!)
            } else {
                let value = Int(abs((accelerData?.acceleration.x)! * 100))
                self.subject.onNext(value)
            }
        })
    }
    
    
    
    func stopUpdates(){
        motionManager.stopAccelerometerUpdates()
    }
    

    func getUpdates() -> Observable<Int>{
        return self.subject.asObserver() 
    }
   
}



