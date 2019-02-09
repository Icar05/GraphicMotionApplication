//
//  ViewController.swift
//  GraphicMotionApplication
//
//  Created by Eddson on 08.02.2019.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    
    
    var isRunning  = false
    
    var bag = DisposeBag()
    
    @IBAction func huy(_ sender: Any) {
        testGraphic()
    }
    
    
    
    @IBOutlet weak var graphic: UIGraphicView!
    
    
    
    let values :[Int] = [10, 5, 1, 5, 2, 5,
                         2, 5, 6, 3, 2, 5,
                         7, 2, 7, 3, 7, 7,
                         2, 7, 2, 7 , 1, 3,
                         5, 2, 4, 4, 6, 7,
                         2, 3, 6, 7, 3, 7, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        // 2. add the gesture recognizer to a view
        graphic.addGestureRecognizer(tapGesture)
    }
    
    // 3. this method is called when a tap is recognized
    @objc func handleTap(sender: UITapGestureRecognizer) {
        testGraphic()
    }

    
    @IBAction func startDraw(_ sender: Any) {
        testGraphic()
    }
    
    
    
    
    
    
    func testGraphic(){

        if isRunning {
            return
        }
        
        isRunning = true
        
        (Observable.zip(
            Observable.from(values),
            Observable<Int>.interval(RxTimeInterval(0.1),
            scheduler: MainScheduler.instance))
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (value, key) in
                    self.graphic.addStep(value: value)
                    print("value -> \(value)")
                    
                },
                onCompleted: {
                    self.isRunning = false
                }
                ) as Disposable)
                        .disposed(by: bag)
                }

}

