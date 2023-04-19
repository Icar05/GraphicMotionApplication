//
//  MainViewCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell, MainCell {
    
    
    @IBOutlet weak var grapicIcon: UIImageView!
    @IBOutlet weak var graphicName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func update(with model: MainModel) {
        
        guard let cellModel: MainCellModel = model as? MainCellModel else {
            return
        }
        
        self.graphicName.text = cellModel.model.title
    }
    
}


    
    
   
    
