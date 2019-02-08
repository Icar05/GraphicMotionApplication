//
//  UIGraphicView.swift
//  GraphicMotionApplication
//
//  Created by Eddson on 08.02.2019.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

@IBDesignable
class UIGraphicView: UIView {

    
    
    
    
    var aPath = UIBezierPath()
    
    var size: CGFloat = 0
    
    var halfHeight:   CGFloat = 0
    
    var startPointX:  CGFloat = 0
    
    var startPointY:  CGFloat = 0
    
    var partOfWidth:  CGFloat = 0
    
    var partOfHeight: CGFloat  = 0
    
    var stepX: CGFloat = 0
    
    
    // we will devide all graphic on parts by count datasource
    var datasource : [Int] = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5 ]
    

    
    
    func addStep(value: Int){
        pushArrayWithValue(value: value)
        clear()
        setNeedsDisplay()
    }
    
    
    
    
    func clear(){
        layer.sublayers = nil;
        aPath = UIBezierPath()
    }
    
    
    func pushArrayWithValue(value: Int){
        var newDatasource: [Int] = []
            newDatasource.append(value)
        
            for i  in datasource {
                newDatasource.append(i)
            }
        
            newDatasource.removeLast()
            datasource = newDatasource
    }
    
    
    override var bounds: CGRect {
        didSet {
            let height = bounds.size.height
            let width = bounds.size.width
            halfHeight = height / 2
            startPointY  = halfHeight
            partOfWidth = bounds.width / CGFloat(datasource.count)
            partOfHeight = partOfWidth
            size = height > width ? width: height
            stepX  =  size / CGFloat(datasource.count)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  
    func drawBackgroundSquere(){
        let test = CGRect(x: 0, y: 0, width: size, height: size)
        let path = UIBezierPath(roundedRect: test, cornerRadius: 20)
        UIColor.black.setFill()
        path.fill()
    }
    

    
    func calculateStepHeight(value: Int) -> CGFloat{
        return CGFloat(value) * stepX
    }
    
    
    
    
    override func draw(_ rect: CGRect) {
        
        drawBackgroundSquere()
        
        startPointX = 0
        
        startPointY = calculateStepHeight(value: datasource[0])
        
        for i: Int in datasource {
            
            aPath.move(to: CGPoint(x:startPointX, y:startPointY))
        
            startPointX = startPointX + partOfWidth
            
            startPointY = calculateStepHeight(value: i)
        
            aPath.addLine(to: CGPoint(x: startPointX, y:startPointY))
            
            aPath.close()
            
            UIColor.red.set()
            aPath.stroke()
        
            aPath.fill()
            
        }
    }
 

}
