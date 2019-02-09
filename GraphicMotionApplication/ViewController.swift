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

    
    @IBAction func huy(_ sender: Any) {
        testGraphic()
    
    }
    @IBOutlet weak var button: UIGraphicView!
    let values :[Int] = [10, 5, 1, 5, 2, 5, 2, 5, 6, 3, 2, 5, 7, 2, 7, 3, 7, 7, 2, 7, 2, 7 , 1, 3, 5, 2, 4
    , 4, 6, 7, 2, 3, 6, 7, 3, 7, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func startDraw(_ sender: Any) {
        testGraphic()
    }
    
    
    
    
    
    
    func testGraphic(){
        

        Observable.zip(
            Observable.from(values),
            Observable<Int>.interval(RxTimeInterval(0.1),
            scheduler: MainScheduler.instance))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (value, key) in
                
                
                self.button.addStep(value: value)
                print("value -> \(value)")
//                self.graphic.setNeedsDisplay()
            })
        
    }

}

