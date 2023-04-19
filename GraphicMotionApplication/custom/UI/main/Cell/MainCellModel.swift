//
//  MainCellModel.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//


import Foundation

struct MainCellModel: MainModel{
 
    
    let title: String
        
    var reuseIdentifier: String = String(describing: MainViewCell.self)
}
