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


    
    @IBOutlet weak var graphic: UIGraphicView!
    
    @IBOutlet weak var smart: UISmartGraphicView!
    
    let provider: Provider = DataProvider()
    
    var isRunning  = true
    
    var bag = DisposeBag()
    
    var dataSource = [2, 6, 2, 6, 13, 6, 22, 7, 39, 2, 5, 2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureSimple = UITapGestureRecognizer(target: self, action: #selector(simpleTap(sender:)))
        let tapGestureSmart = UITapGestureRecognizer(target: self, action: #selector(smartTap(sender:)))

        
        graphic.addGestureRecognizer(tapGestureSimple)
        smart.addGestureRecognizer(tapGestureSmart)
        
        subscribeToProvider()
        
        
        do {
           try  smart.setupWithArray(values: dataSource)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    func subscribeToProvider(){
           provider.getUpdates()
                .observeOn(MainScheduler.instance)
                .subscribe(
                   onNext: { (n) in
                    print("onNext -> \(n) ")
                    self.graphic.pushValue(value: n)
                }, onError: { (error) in
                    print("Error with sensor -> \(error.localizedDescription) ")
                }, onCompleted: {
                    print("complete asselerate emits")
                }, onDisposed: {
                    self.provider.stopUpdates()
                    print("dispose values")
                }).disposed(by: bag)
    }
    
    
    @objc func smartTap(sender: UITapGestureRecognizer){
        let randomInt = Int.random(in: 0..<dataSource.max()!)

        print("random: \(randomInt)")
    
        do {
           try  smart.pushValue(value: randomInt)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }

    @objc func simpleTap(sender: UITapGestureRecognizer) {
        isRunning = !isRunning
        isRunning ? provider.stopUpdates() : provider.startUpdates()
    }
    
    
   

}

