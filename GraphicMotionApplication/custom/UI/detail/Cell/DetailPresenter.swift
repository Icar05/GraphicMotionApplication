//
//  DetailPresenter.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit


public struct SelectedGraphicModel{
    let view: UIView
    let title: String
    let description: String
}


public final class DetailPresenter {
    
    
    private let model: SelectedGraphicModel
    
    unowned var view: DetailController!
    
    public func set(view: DetailController) {
        self.view = view
    }
    
    init(model: SelectedGraphicModel){
        self.model = model
    }
    
    public func viewDidLoad(){
        let cells = prepareCells(model)
        self.view.registerCells(models: cells)
    }
    
    
    private func prepareCells(_ model: SelectedGraphicModel) -> [DetailModel]{
        return [
            DetailtitleCellModel(title: model.title)
        ]
    }
}
