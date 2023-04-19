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
    
    private let upater = RandomUpdater()
    
    private let player = AudioHelper()
    
    private var isStarted = false
    
    unowned var view: DetailController!
    
    
    
    
    public func set(view: DetailController) {
        self.view = view
    }
    
    init(model: ExampleGraphicModel){
        self.model = model
        self.upater.delegate = { [weak self] value in
            print("value: \(value)")
            self?.player.playAudio(sound: model.sound)
        }
    }
    
    public func viewDidLoad(){
        let cells = prepareCells(model)
        self.view.setTitle(model.title)
        self.view.registerCells(models: cells)
    }
    
    public func onExitController(){
        self.isStarted = false
        self.updateChanges()
    }
    
    private func toggleUpdater(){
        self.isStarted = !isStarted
        self.updateChanges()
    }
    
    private func updateChanges(){
        self.isStarted ? self.upater.start() : self.upater.stop()
        self.view.updateTitleForButton(isStarted: isStarted)
    }
    
    private func prepareCells(_ model: ExampleGraphicModel) -> [DetailModel]{
        return [
            DetailViewCellModel(view: model.view),
            DetailDescriptionCellModel(descriiption: model.description),
            DetailActionCellModel(callback: { [weak self]  in
                self?.toggleUpdater()
            })
        ]
    }
}
