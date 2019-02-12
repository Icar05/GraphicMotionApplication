//
//  MockDataProvider.swift
//  GraphicMotionApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/12.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class MockDataProvider : Provider{
    

    
    
    func startUpdates() {
      //todo
    }
    
    func stopUpdates() {
        //todo
    }
    
    func getUpdates() -> Observable<Int> {
       return Observable.just(1)
    }
    
   
    
//    func fillValues(){
//        for _ in 1 ..< 100{
//            values.append(Int.random(in: 0 ..< 50))
//        }
//        
//    }
    
    //    func testGraphic(){
    //
    //
    //        if isRunning {
    //            provider.stopUpdates()
    //            return
    //        }
    //
    //
    //        isRunning = true
    //        provider.startUpdates()
    //
    //        (Observable.zip(
    //            Observable.from(values),
    //            Observable<Int>.interval(RxTimeInterval(0.1),
    //            scheduler: MainScheduler.instance))
    //            .observeOn(MainScheduler.instance)
    //            .subscribe(
    //                onNext: { (value, key) in
    //                    self.graphic.pushValue(value: value)
    //                    print("value -> \(value)")
    //
    //                },
    //                onCompleted: {
    //                    self.isRunning = false
    //                }
    //                ) as Disposable)
    //                        .disposed(by: bag)
    //                }
    
}
