//
//  DetailActionCell.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailActionCell: UITableViewCell, DetailCell {
    
    
    @IBOutlet weak var actionBtn: UIButton!
    
    @IBAction func didButtonClick(_ sender: Any) {
        self.action?()
    }
    
    private var action: (() -> Void)? = nil
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.actionBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.updateTitle(false)
    }
    
    func update(with model: DetailModel) {
        
        guard let cellModel: DetailActionCellModel = model as? DetailActionCellModel else {
            return
        }
        
        self.action = cellModel.callback
    }
    
    func updateTitle(_ isStarted: Bool){
        self.actionBtn.setTitle(getTitle(isStarted), for: .normal)
        self.actionBtn.setTitle(getTitle(isStarted), for: .selected)
    }
    
    private func getTitle(_ isStarted: Bool) -> String {
        return  isStarted ? "Stop Example" : "Start Example"
    }
    
}

