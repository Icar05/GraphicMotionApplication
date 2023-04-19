//
//  UpdateGraphicViewhelper.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import GraphicLB

class UpdateGraphicViewhelper{
    
    public func update(_ value: Int, _ maxValue: Int, _ view: UIView, _ valueLabel: UILabel){
        
        if(view is UIDoubleGraphic){
            self.updateDoubeGraphic(value, maxValue, view as? UIDoubleGraphic, valueLabel)
        } else if(view is UIEqualizer){
            self.updateEqualizer(view as? UIEqualizer, valueLabel)
        } else if(view is UIGraphic){
            self.updateUIGraphic(value, maxValue, view as? UIGraphic, valueLabel)
        }else{
            self.handleNotImplemented(view)
        }
        
    }
    
    private func updateEqualizer(_ graphic: UIEqualizer?, _ valueLabel: UILabel){
        let freshModel = UIEqualizerModel.random()
        let yValues: [CGFloat] = freshModel.getValues().map { return $0.y}
        let max: Int = Int(yValues.max() ?? 0)
        let sumArray = yValues.reduce(0, +)
        let avarageValue: Int = Int(sumArray / CGFloat(yValues.count))
        
        valueLabel.text = "[ \(avarageValue) / \(max) ]"
        graphic?.drawDiagrammAnimated(model: freshModel)
    }
    
    private func updateDoubeGraphic(_ value: Int, _ maxValue: Int, _ graphic: UIDoubleGraphic?, _ label: UILabel){
        do{
            label.text = "[ \(value) / \(maxValue) ]"
            try  graphic?.pushValue(grapicIndex: 0, value: value)
            try  graphic?.pushValue(grapicIndex: 1, value: Int.random(in: 1...maxValue))
        }catch let error{
            self.handleError(error)
        }
    }
    
    private func updateUIGraphic(_ value: Int, _ maxValue: Int, _ graphic: UIGraphic?, _ label: UILabel){
        do{
            label.text = "[ \(value) / \(maxValue) ]"
            try  graphic?.pushValue(value: value)
        }catch let error{
            self.handleError(error)
        }
    }
    
    private func handleNotImplemented(_ view: UIView){
        print("need implement \(view.theClassName)")
    }
    
    private func handleError(_ error: Error){
        print("error while push value: \(error)")
    }
}


extension UIView{
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
}
