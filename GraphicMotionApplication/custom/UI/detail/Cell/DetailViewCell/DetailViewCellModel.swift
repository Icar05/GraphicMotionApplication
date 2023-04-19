//
//  DetailViewCellModel.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

struct DetailViewCellModel: DetailModel{
 
    let view: UIView
        
    var reuseIdentifier: String = String(describing: DetailViewCell.self)
}
