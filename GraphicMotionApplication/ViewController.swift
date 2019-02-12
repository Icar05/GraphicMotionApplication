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
    
    let provider: Provider = DataProvider()
    
    var isRunning  = true
    
    var bag = DisposeBag()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        graphic.addGestureRecognizer(tapGesture)
        
        subscribeToProvider()
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
    

    @objc func handleTap(sender: UITapGestureRecognizer) {
        isRunning = !isRunning
        isRunning ? provider.stopUpdates() : provider.startUpdates()
    }
    
    
   

}

