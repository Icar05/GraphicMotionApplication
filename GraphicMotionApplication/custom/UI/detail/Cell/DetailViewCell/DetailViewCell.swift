//
//  DetailViewCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell, DetailCell {
    
    
    @IBOutlet weak var content: UIView!
    
    private var graphicView: UIView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with model: DetailModel) {
        
        guard let cellModel: DetailViewCellModel = model as? DetailViewCellModel else {
            return
        }
        
        self.graphicView = cellModel.view
        self.content.addSubview(cellModel.view)
        self.layoutSubviews()
    }
    
    
}


