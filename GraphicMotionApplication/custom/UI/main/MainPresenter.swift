//
//  MainPresenter.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//


import UIKit
import GraphicLB

public struct ExampleGraphicModel{
//    let view: UIView
    let title: String
    let description: String
}


public final class MainPresenter {
    
    
    /**
     String(describing: UIGraphicView.self),
     String(describing: UIModernGraphicView.self),
     String(describing: UIDoubleColorGraphic.self),
     String(describing: UIDoubleGraphic.self),
     String(describing: UIEqualizer.self),
     */
    private let source: [ExampleGraphicModel] = [
        ExampleGraphicModel(
            title: String(describing: UIGraphicView.self),
            description: "First implementation. Very simple"
        )
    ]
    
    unowned var view: MainController!
    
    public func set(view: MainController) {
        self.view = view
    }
    
    public func viewDidLoad(){
        let cells = prepareCells(source)
        self.view.registerCells(cells)
    }
    
    
    private func prepareCells(_ models: [ExampleGraphicModel]) -> [MainModel]{
        return models.map{ MainCellModel(model: $0) }
    }
}
