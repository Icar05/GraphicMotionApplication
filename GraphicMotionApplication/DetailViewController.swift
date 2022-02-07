//
//  DetailViewController.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 07.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var testUI: UITest!
    
    @IBOutlet weak var graphic: UIGraphicView!
    
    @IBOutlet weak var smart: UISmartGraphicView!
    
    let provider: Provider = DataProvider()
    
    var isRunning  = true
    
    var bag = DisposeBag()
    
    var dataSource = [2, 9, 4, 12 , 0, 5, 3, 6, 3, 9, 8, 3]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureSimple = UITapGestureRecognizer(target: self, action: #selector(simpleTap(sender:)))
        let tapGestureSmart = UITapGestureRecognizer(target: self, action: #selector(smartTap(sender:)))
        let tapGestureTest = UITapGestureRecognizer(target: self, action: #selector(testTap(sender:)))
        
        
        graphic.addGestureRecognizer(tapGestureSimple)
        smart.addGestureRecognizer(tapGestureSmart)
        testUI.addGestureRecognizer(tapGestureTest)
        
        subscribeToProvider()
        
        
        do {
            try  smart.setupWithArray(values: dataSource)
        } catch let error {
            print(error.localizedDescription)
        }
        
        do {
            try  testUI.setupWithArray(values: dataSource)
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
    
    @objc func testTap(sender: UITapGestureRecognizer){
        let randomInt = Int.random(in: 0..<dataSource.max()!)
        
        print("random: \(randomInt)")
        
        do {
            try  testUI.pushValue(value: randomInt)
        } catch let error {
            print(error.localizedDescription)
        }
        
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

