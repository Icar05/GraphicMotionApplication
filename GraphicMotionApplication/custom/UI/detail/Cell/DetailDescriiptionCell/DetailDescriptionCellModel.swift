//
//  DetailDescriptionCellModel.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailDescriptionCellModel: DetailModel{
 
    let descriiption: String
        
    var reuseIdentifier: String = String(describing: DetailDescriptionCell.self)
}
