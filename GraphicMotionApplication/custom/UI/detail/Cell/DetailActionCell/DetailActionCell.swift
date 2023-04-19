//
//  DetailActionCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailActionCell: UITableViewCell, DetailCell {
    
    @IBAction func didButtonClick(_ sender: Any) {
        self.action?()
    }
    
    private var action: (() -> Void)? = nil
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func update(with model: DetailModel) {
        
        guard let cellModel: DetailActionCellModel = model as? DetailActionCellModel else {
            return
        }
        
        self.action = cellModel.callback
    }
    
}

