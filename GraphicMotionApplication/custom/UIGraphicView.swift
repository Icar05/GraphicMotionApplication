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

    
    
    @IBInspectable var bC: UIColor = UIColor.black
    
    @IBInspectable var guideColor: UIColor = UIColor.red
    
    @IBInspectable var graphicColor: UIColor = UIColor.white

    var sizeOfView: CGFloat = 200

    var startPointX: CGFloat = 0

    var startPointY: CGFloat = 0

    var stepInPixel: CGFloat = 0

    let guidesCount = 9

    let datasourceCount = 50

    var datasource: [Int] = []
    
    var graphicPath = UIBezierPath()
    
    var guidePath = UIBezierPath()
    
    
    
    
    
    
    override func prepareForInterfaceBuilder(){
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    override var bounds: CGRect {
        didSet {
            self.frame = CGRect(x: 0, y: 0, width: sizeOfView, height: sizeOfView)
        }
    }
    
    
    func setup(){
        self.layer.bounds.size = CGSize(width: CGFloat(sizeOfView), height: CGFloat(sizeOfView))
        self.backgroundColor = bC
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.datasource = createDatarource(count: datasourceCount)
        self.startPointY  = sizeOfView / 2
        self.stepInPixel  =  sizeOfView / CGFloat(datasource.count)
    }
    
    
    
    override func draw(_ rect: CGRect) {
        drawGuideLines()
        drawGraphic()
    }
    
    
    
    
    
    func drawGuideLines(){
    
                guideColor.setStroke()
    
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
    
    
    
    
    
    //calculation
    func calculateVersicalStep() -> CGFloat{
        return  sizeOfView / CGFloat(guidesCount)
    }
    
    
    
    
    func drawGraphic(){
        
        graphicColor.setStroke()
    
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
    
    
    
    func calculateStepHeight(value: Int) -> CGFloat{
        return CGFloat(value) * stepInPixel
    }
    
    
    func createDatarource(count: Int) -> [Int]{
        var res : [Int] = []
        let middleValue = count / 2
    
        for _ in 1 ..< count{
            res.append(middleValue)
        }
    
        return res
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
    
    

    
    func pushArrayWithValue(value: Int){
        var newDatasource: [Int] = []
            newDatasource.append(value)
        
            datasource.forEach {
                (value) in newDatasource.append(value )}
        
            newDatasource.removeLast()
            datasource = newDatasource
    }


    
}
