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
    
    var guidePath = UIBezierPath()
    
    var size: CGFloat = 200
    
    var halfHeight:   CGFloat = 0
    
    var startPointX:  CGFloat = 0
    
    var startPointY:  CGFloat = 0
    
    var partOfWidth:  CGFloat = 0
    
    var partOfHeight: CGFloat  = 0
    
    var stepX: CGFloat = 0
    
    
    // we will devide all graphic on parts by count datasource
    var datasource : [Int] = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5 ]
    

    
    
    
    
    override var bounds: CGRect {
        didSet {
            self.frame = CGRect(x: 0, y: 0, width: size, height: size)
            self.backgroundColor = UIColor.black
            self.halfHeight = size / 2
            self.startPointY  = halfHeight
            self.partOfWidth = size / CGFloat(datasource.count)
            self.partOfHeight = partOfWidth
            self.stepX  =  size / CGFloat(datasource.count)
        }
    }
    
    
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }
    
    
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
    

    
    func calculateStepHeight(value: Int) -> CGFloat{
        return CGFloat(value) * stepX
    }
    

    
    
    func drawGuideLines(){
        
        let guidePath = UIBezierPath()
        
            UIColor.red.setStroke()
        
            guidePath.stroke()
        
        let step = calculateVersicalStep()
        
        var offset = step
        
        
        for _ in 1 ..< datasource.count - 1{
           
            guidePath.move(to: CGPoint(x:0,  y:offset))
            
            guidePath.addLine(to: CGPoint(x: bounds.width, y:offset))
                
            offset  = offset + step
            
        }
        
            guidePath.stroke()
            guidePath.close()
    }
    
    func calculateVersicalStep() -> CGFloat{
        return  size / CGFloat((datasource.count - 1))
    }
    
    
    func drawGraphic(){
        
        UIColor.white.setStroke()
        
        startPointX = 0
        
        startPointY = calculateStepHeight(value: datasource[0])
        
        for i: Int in datasource {
            
            aPath.move(to: CGPoint(x:startPointX, y:startPointY))
            
            startPointX = startPointX + partOfWidth
            
            startPointY = calculateStepHeight(value: i)
            
            aPath.addLine(to: CGPoint(x: startPointX, y:startPointY))
            
            aPath.stroke()
            
        }
        
        aPath.close()
    }
    
    
    
    
    
    override func draw(_ rect: CGRect) {
        
        drawGuideLines()
        
        drawGraphic()
       
    }
 

//    override open class var layerClass: AnyClass {
//        get{
//            return CAGradientLayer.classForCoder()
//        }
//    }
//
//    func createGradientLayer() {
//        let gradientLayer = self.layer as! CAGradientLayer
//        let colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
//        gradientLayer.colors = [colors[0], colors[1]]
//        gradientLayer.cornerRadius = 20
//    }
    
}
