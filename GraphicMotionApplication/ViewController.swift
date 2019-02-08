//
//  ViewController.swift
//  GraphicMotionApplication
//
//  Created by Eddson on 08.02.2019.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    
    let values :[Int] = [10, 5, 1, 5, 2, 5, 2, 5, 6, 3, 2, 5, 7, 2, 7, 3, 7, 7, 2, 7, 2, 7 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testGraphic()
    }

    
    @IBOutlet weak var graphic: UIGraphicView!
    
    
    
    func testGraphic(){
        
        
        
        Observable.zip(
            Observable.from(values),
            Observable<Int>.interval(RxTimeInterval(10),
            scheduler: MainScheduler.instance))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (value, key) in
                
                
                self.graphic.addStep(value: value)
                print("value -> \(value)")
//                self.graphic.setNeedsDisplay()
            })
        
    }

}

