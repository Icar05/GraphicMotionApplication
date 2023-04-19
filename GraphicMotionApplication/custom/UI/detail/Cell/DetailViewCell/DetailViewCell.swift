//
//  DetailViewCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell, DetailCell {
    
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var content: UIView!
    
    private let updateViewHelper = UpdateGraphicViewhelper()
    
    private var graphicView: UIView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(with model: DetailModel) {
        
        guard let cellModel: DetailViewCellModel = model as? DetailViewCellModel else {
            return
        }
        
        self.graphicView = cellModel.view
        self.content.addSubview(cellModel.view)
        self.layoutSubviews()
    }
    
    func updateViewWithValue(_ value: Int, _ maxValue: Int){
        guard let graphicView = graphicView else { return }
        self.updateViewHelper.update(value, maxValue, graphicView, valueLabel)
    }
    
    
}


