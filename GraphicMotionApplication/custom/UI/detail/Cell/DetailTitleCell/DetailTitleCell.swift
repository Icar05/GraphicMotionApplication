//
//  DetailTitleCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailTitleCell: UITableViewCell, DetailCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(with model: DetailModel) {
        
        guard let cellModel: DetailtitleCellModel = model as? DetailtitleCellModel else {
            return
        }
        
        self.titleLabel.text = cellModel.title
    }
    
    
}


