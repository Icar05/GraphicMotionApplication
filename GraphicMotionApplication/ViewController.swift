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
    
    @IBAction func huy(_ sender: Any) {testGraphic()}
    
    @IBOutlet weak var graphic: UIGraphicView!
    
    var values :[Int] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillValues()
 
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        graphic.addGestureRecognizer(tapGesture)
    }
    
    
    func fillValues(){
        for _ in 1 ..< 100{
            values.append(Int.random(in: 0 ..< 50))
        }
        
    }
    

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
                    self.graphic.pushValue(value: value)
                    print("value -> \(value)")
                    
                },
                onCompleted: {
                    self.isRunning = false
                }
                ) as Disposable)
                        .disposed(by: bag)
                }

}

