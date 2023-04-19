//
//  DetailtitleCellModel.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//


import Foundation

struct DetailtitleCellModel: DetailModel{
 
    
    let title: String
        
    var reuseIdentifier: String = String(describing: DetailTitleCell.self)
}
