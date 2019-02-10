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

    
    
    
    
    var graphicPath = UIBezierPath()
    
    var guidePath = UIBezierPath()
    
    var sizeOfView: CGFloat = 200
    
    var startPointX: CGFloat = 0
    
    var startPointY: CGFloat = 0
    
    var stepInPixel: CGFloat = 0
    
    let guidesCount = 9

    let datasourceCount = 50
    
    var datasource: [Int] = []
    
    
    
    
    
    
    
    
    
    override var bounds: CGRect {
        didSet {
            self.frame = CGRect(x: 0, y: 0, width: sizeOfView, height: sizeOfView)
            self.backgroundColor = UIColor.black
            self.startPointY  = sizeOfView / 2
            self.stepInPixel  =  sizeOfView / CGFloat(datasource.count)
        }
    }
    
    
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = 20
        layer.masksToBounds = true
        datasource = createDatarource(count: datasourceCount)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }
    
    
    func pushValue(value: Int){
        if(value <= datasourceCount){
            pushArrayWithValue(value: value)
            clear()
            setNeedsDisplay()
        }
    }
    
    
    func clear(){
        layer.sublayers = nil;
        graphicPath = UIBezierPath()
    }
    
    
    
    func createDatarource(count: Int) -> [Int]{
        var res : [Int] = []
        let middleValue = count / 2
        
        for _ in 1 ..< count{
            res.append(middleValue)
        }
        
        return res
    }
    
    func pushArrayWithValue(value: Int){
        var newDatasource: [Int] = []
            newDatasource.append(value)
        
            datasource.forEach {
                (value) in newDatasource.append(value )}
        
            newDatasource.removeLast()
            datasource = newDatasource
    }
    

    
    func calculateStepHeight(value: Int) -> CGFloat{
        return CGFloat(value) * stepInPixel
    }
    

    
    
    func drawGuideLines(){
        
        let guidePath = UIBezierPath()
        
            UIColor.red.setStroke()
        
            guidePath.stroke()
        
        let step = calculateVersicalStep()
        
        var offset = step
        
        
        for _ in 1 ..< guidesCount{
           
            guidePath.move(to: CGPoint(x:0,  y:offset))

            guidePath.addLine(to: CGPoint(x: bounds.width, y:offset))
                
            offset  = offset + step
            
        }
        
        guidePath.stroke()
        guidePath.close()
    }
    
    func calculateVersicalStep() -> CGFloat{
        return  sizeOfView / CGFloat(guidesCount)
    }
    
    
    func drawGraphic(){
        
        UIColor.white.setStroke()
        
        startPointX = 0
        
        startPointY = calculateStepHeight(value: datasource[0])
        
        for i: Int in datasource {
            
            graphicPath.move(to: CGPoint(x:startPointX, y:startPointY))
            
            startPointX = startPointX + stepInPixel
            
            startPointY = calculateStepHeight(value: i)
            
            graphicPath.addLine(to: CGPoint(x: startPointX, y:startPointY))
            
            graphicPath.stroke()
            
        }
        
        graphicPath.close()
    }
    
    
    
    
    
    override func draw(_ rect: CGRect) {

        drawGuideLines()
        
        drawGraphic()
       
    }
 
    
}
