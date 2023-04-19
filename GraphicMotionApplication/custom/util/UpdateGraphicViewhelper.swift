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
    
    public func update(_ value: Int, _ view: UIView){
        
        
        if(view is UIDoubleGraphic){
            self.handleNotImplemented(view)
        } else if(view is UIEqualizer){
            self.handleNotImplemented(view)
        } else if(view is UIGraphic){
            do{
                try  (view as? UIGraphic)?.pushValue(value: value)
            }catch let error{
                self.handleError(error)
            }
        }else{
            self.handleNotImplemented(view)
        }
        
    }
    
    
    private func handleNotImplemented(_ view: UIView){
        print("need implement \(String(describing: view.self))")
    }
    
    private func handleError(_ error: Error){
        print("error while push value: \(error)")
    }
    
    
}
