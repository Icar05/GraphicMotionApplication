//
//  ViewController.swift
//  GraphicMotionApplication
//
//  Created by Eddson on 08.02.2019.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

struct DataCell{
    var name: String
    var desc: String
    var view: Graphic
}

class ViewController: UIViewController {
    
    
    private let data = [
        DataCell(name: "UIGraphic",
                 desc: "First realization",
                 view: UIGraphicView()),
        DataCell(name: "UISmartGraphic",
                 desc: "Second realization, calculate values align to max value",
                 view: UISmartGraphicView()),
        DataCell(name: "UITest",
                 desc: "Last realization with calculation and nice design",
                 view: UITest())
    ]
    
    private var timer: Timer?
    
    private let numbers = [1,4,2,4,3,4,4,6,5,7,6,8,7,8,8,7,9,10]
            
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        let nib = UINib(nibName: String(describing: ShowGraphicCell.self), bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: String(describing: ShowGraphicCell.self))
        
        self.setupGraphicsArrays()
    }
    
    
    
    func startTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            simultiniouslyUpdate ? self.updateAll() : self.updateSelected()
        }
    }
    
    func stopTimer(){
        self.timer?.invalidate()
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        if(indexPath.row == data.count){
            let indifier = String(describing: TopCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: indifier, for: indexPath) as! TopCell
                cell.setup{value in value ? self.startTimer() : self.stopTimer() }
            
            return cell
        }
        
      
    
        let indifier = String(describing: ShowGraphicCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: indifier, for: indexPath) as! ShowGraphicCell
            cell.setup(data: data[indexPath.row] )
        
        return cell
        
    }
    
    
    private func setupGraphicsArrays(){
        for index in 0...data.count - 1{
            setupGraphicInRowWithValues(index: index)
        }
    }
    
    
    private func updateSelected(){
        let randomNumber = Int.random(in: 1...self.numbers.max()!)
        let randomIndex = Int.random(in: 0...2)
        setNewValueInRowWithValues(index: randomIndex, value: randomNumber)
    }
    
    private func updateAll(){
        for index in 0...self.data.count - 1{
            let randomNumber = Int.random(in: 1...self.numbers.max()!)
            self.setNewValueInRowWithValues(index: index, value: randomNumber)
        }
    }
    
    private func setNewValueInRowWithValues(index: Int, value: Int){
        do{
            try data[index].view.pushValue(value: value)
        }catch let error{
            print("error while push value: \(error)")
        }
    }
    
    private func setupGraphicInRowWithValues(index: Int){
        do{
            try data[index].view.setupWithArray(values: numbers)
        }catch let error{
            print("error while insert array: \(error)")
        }
    }
    
}
