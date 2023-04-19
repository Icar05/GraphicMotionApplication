//
//  DetailDataSource.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

protocol DetailModel{
    var reuseIdentifier: String { get }
}

protocol DetailCell: UITableViewCell {
    func update(with model: DetailModel)
}


final class DetailDataSource : NSObject, UITableViewDataSource, UITableViewDelegate{
    
    
    private var data: [DetailModel] = []
        
    func setData(data: [DetailModel]){
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let model = data[indexPath.row]
        let id = model.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)  as! DetailCell
            cell.update(with: model)

            return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
}
