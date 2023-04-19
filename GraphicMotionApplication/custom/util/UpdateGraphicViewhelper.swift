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
    
    public func update(_ value: Int, _ maxValue: Int, _ view: UIView){
        
        
        if(view is UIDoubleGraphic){
            self.updateDoubeGraphic(value, maxValue, view as? UIDoubleGraphic)
        } else if(view is UIEqualizer){
            self.handleNotImplemented(view)
        } else if(view is UIGraphic){
            self.updateUIGraphic(value, view as? UIGraphic)
        }else{
            self.handleNotImplemented(view)
        }
        
    }
    
    private func updateDoubeGraphic(_ value: Int, _ maxValue: Int, _ graphic: UIDoubleGraphic?){
        do{
            try  graphic?.pushValue(grapicIndex: 0, value: value)
            try  graphic?.pushValue(grapicIndex: 1, value: Int.random(in: 1...maxValue))
        }catch let error{
            self.handleError(error)
        }
    }
    
    private func updateUIGraphic(_ value: Int, _ graphic: UIGraphic?){
        do{
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
