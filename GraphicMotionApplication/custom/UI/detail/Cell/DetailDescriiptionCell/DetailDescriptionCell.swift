//
//  DetailDescriptionCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//


import UIKit

class DetailDescriptionCell: UITableViewCell, DetailCell {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with model: DetailModel) {
        
        guard let cellModel: DetailDescriptionCellModel = model as? DetailDescriptionCellModel else {
            return
        }
        
        self.descriptionLabel.text = cellModel.descriiption
    }
    
    
}
