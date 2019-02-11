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

class DataProvider{
    
    
    var bag = DisposeBag()
    
    var motionManager: CMMotionManager!
    
    
    
    init(){
        motionManager = CMMotionManager()
    }
    

    
    
    func startUpdates(){
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!,
                                                withHandler: { data, error in
            guard error == nil else { return }
            guard let accelerometerData = data else { return }
                                                    
            print("data accelerator \(accelerometerData.acceleration.x )" )
                                                    
        })
        
    }
    
    
    func update(){
        
    }
    
    func stopUpdates(){
        motionManager.stopAccelerometerUpdates()
    }
    
    
}


/*
 func getWeather(city: String) -> Observable<[List]> {
 
 
 */
