//
//  DetailPresenter.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit


public final class DetailPresenter {
    
    
    private let model: ExampleGraphicModel
    
    unowned var view: DetailController!
    
    public func set(view: DetailController) {
        self.view = view
    }
    
    init(model: ExampleGraphicModel){
        self.model = model
    }
    
    public func viewDidLoad(){
        let cells = prepareCells(model)
        self.view.setTitle(model.title)
        self.view.registerCells(models: cells)
    }
    
    
    private func prepareCells(_ model: ExampleGraphicModel) -> [DetailModel]{
        return [
            DetailViewCellModel(view: model.view),
            DetailDescriptionCellModel(descriiption: model.description)
        ]
    }
}
