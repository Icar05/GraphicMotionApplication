//
//  MainDataSource.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

protocol MainModel{
    var reuseIdentifier: String { get }
}

protocol MainCell: UITableViewCell {
    func update(with model: MainModel)
}


final class MainDataSource : NSObject, UITableViewDataSource, UITableViewDelegate{
    
    
    private var data: [MainModel] = []
    
    var callback: ((_ model: MainModel) -> Void )? = nil
    
    func setData(data: [MainModel]){
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let model = data[indexPath.row]
        let id = model.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)  as! MainCell
            cell.update(with: model)

            return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.callback?(data[indexPath.row])
        
    }
    
}
