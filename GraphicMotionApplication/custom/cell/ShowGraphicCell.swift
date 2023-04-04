//
//  ShowGraphicCell.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 10.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import GraphicLB

class ShowGraphicCell: UITableViewCell{
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var forGraphic: UIView!
    
    private var graphic: UIGraphic? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(data: DataCell) {
        self.nameLabel.text = data.name
        self.descriptionLabel.text = data.desc
        self.graphic = data.view
        self.forGraphic.addSubview(data.view.getUIView())
        self.selectionStyle = .none
    }
    
    open func getGraphic() -> UIGraphic{
        return self.graphic!
    }
}
