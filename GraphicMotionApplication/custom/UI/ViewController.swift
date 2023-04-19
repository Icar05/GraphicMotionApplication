////
////  ViewController.swift
////  GraphicMotionApplication
////
////  Created by Eddson on 08.02.2019.
////  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
////
//
//import UIKit
//import GraphicLB
//
//struct DataCell{
//    var name: String
//    var desc: String
//    var view: UIGraphic
//}
//
//class ViewController: UIViewController {
//
//    private let colors: [UIColor] = [UIColor.red, UIColor.green]
//
//    private let audioTool = AudioHelper()
//
//
//
//    private var timer: Timer?
//
//    private let numbers = [1,4,2,4,3,4,4,6,5,7,6,8,7,8,8,7,9,10]
//
//    @IBOutlet weak var tableView: UITableView!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.dataSource = self
//        self.tableView.separatorStyle = .none
//
//
//
//        self.setupGraphicsArrays()
//    }
//
//}
//
//extension ViewController: UITableViewDataSource{
//
//
//
//
//
//    private func setupGraphicsArrays(){
//        for index in 0...data.count - 1{
//            setupGraphicInRowWithValues(index: index)
//        }
//    }
//
//
//    private func updateSelected(){
//        let randomNumber = Int.random(in: 1...self.numbers.max()!)
////        let randomIndex = Int.random(in: 0...self.data.count - 1)
//        setNewValueInRowWithValues(index: randomIndex, value: randomNumber)
//    }
//
//    private func updateAll(){
//        for index in 0...self.data.count - 1{
//            let randomNumber = Int.random(in: 1...self.numbers.max()!)
//            self.setNewValueInRowWithValues(index: index, value: randomNumber)
//        }
//    }
//
//    private func setNewValueInRowWithValues(index: Int, value: Int){
//        do{
//            let view = data[index].view
//
//
//            if(view is UIDoubleGraphic){
//
//                let mView = view as? UIDoubleGraphic
//
//                for i in 0...1{
//                    try mView?.pushValue(index: i, value: Int.random(in: 1...self.numbers.max()!))
//                }
//
//                mView?.update()
//
//            }else{
//                try data[index].view.pushValue(index: 0, value: value)
//            }
//
//        }catch let error{
//            print("error while push value: \(error)")
//        }
//    }
//
////    private func setupGraphicInRowWithValues(index: Int){
////        do{
////            var view = data[index].view
////            let sound = getSoundForView(view: view)
////                view.onValueChanged = { [weak self] in
////                    self?.audioTool.playAudio(sound: sound)
////                }
////
////            if(view is UIDoubleGraphic){
////
////                for i in 0...1{
////
////                    var model = UIDoubleGraphicModel(
////                        positivewColor: colors[i],
////                        negativeColor: colors[i],
////                        values: Queue(prepareNumbers())
////                    )
////                    try (view as? UIDoubleGraphic)?.setupWithArray(model: &model)
////                }
////
////            }else{
////                try view.setupWithArray(values: numbers)
////            }
////
////
////        }catch let error{
////            print("error while insert array: \(error)")
////        }
////    }
//
//
//
////    private func prepareNumbers() -> [Int]{
////
////        var res: [Int] = []
////
////        for _ in 0...numbers.count - 1{
////            res.append(Int.random(in: 1..<10))
////        }
////
////        return res
////    }
//
//}
