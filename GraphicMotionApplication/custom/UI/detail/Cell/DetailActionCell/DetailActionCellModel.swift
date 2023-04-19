//
//  DetailActionCellModel.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailActionCellModel: DetailModel{
 
    let callback: () -> Void
        
    var reuseIdentifier: String = String(describing: DetailActionCell.self)
}
