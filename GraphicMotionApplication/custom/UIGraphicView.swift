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
    
    @IBInspectable var guideColor: UIColor = UIColor.gray
    
    @IBInspectable var graphicColor: UIColor = UIColor.white
    
    let sizeOfView: CGFloat = 200
    
    let guidesCount = 9
    
    let horizontalOffset = 20
    
    let maxDataSourceCount = 50
    
    var startPointX: CGFloat = 0
    
    var startPointY: CGFloat = 0
    
    var stepInPixel: CGFloat = 0
    
    var datasource: Queue<Int> = Queue()
    
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
    
    //to avoid size bigger than sizeOfView
    override var bounds: CGRect {
        didSet {
            self.frame = CGRect(x: 0, y: 0, width: sizeOfView, height: sizeOfView)
        }
    }
    
    
    private func setup(){
        self.layer.bounds.size = CGSize(width: CGFloat(sizeOfView), height: CGFloat(sizeOfView))
        self.backgroundColor = bC
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        let values = createEmptyValues(count: maxDataSourceCount)
        self.datasource.setup(values)
        
        self.startPointY  = sizeOfView / 2
        self.stepInPixel  =  sizeOfView / CGFloat(datasource.count())
    }
    
    
    
    override func draw(_ rect: CGRect) {
        drawGuideLines()
        drawGraphic()
    }
    
    
    private func drawGuideLines(){
        
        guideColor.setStroke()
        guidePath.stroke()
        
        let step = sizeOfView / CGFloat(guidesCount)
        var offset = step
        
        
        for _ in 1 ..< guidesCount{
            guidePath.move(to: CGPoint(x:0,  y:offset))
            guidePath.addLine(to: CGPoint(x: bounds.width, y:offset))
            
            offset  = offset + step
        }
        
        guidePath.stroke()
        guidePath.close()
    }
    
    
    private func drawGraphic(){
            
        startPointX = 0
        startPointY = calculateStepHeight(value: datasource.getElement(index: 0))
        
        for i: Int in datasource.getElements() {
            
            graphicPath = UIBezierPath()
            getColor(yValue: startPointY).setStroke()
            
            graphicPath.move(to: CGPoint(x:startPointX, y:startPointY))
            
            startPointX = startPointX + stepInPixel
            startPointY = calculateStepHeight(value: i)
            
            graphicPath.addLine(to: CGPoint(x: startPointX, y:startPointY))
            graphicPath.stroke()
            
        }
        
        graphicPath.close()
    }
    
    
    private func getColor(yValue: CGFloat) -> UIColor{
        let center = sizeOfView / 2
        
        if(yValue > center + CGFloat(horizontalOffset)){
            return UIColor.red
        }else if (yValue < center - CGFloat(horizontalOffset)){
            return UIColor.green
        }else{
            return UIColor.orange
        }
    }
    
    private func calculateStepHeight(value: Int) -> CGFloat{
        return CGFloat(value) * stepInPixel
    }
    
    
    private func createEmptyValues(count: Int) -> [Int]{
        let middleValue = count / 2
        return [Int](repeating: middleValue, count: count)
    }
    
    func pushValue(value: Int){
        self.datasource.push(value)
        self.layer.sublayers = nil
        self.graphicPath = UIBezierPath()
        self.setNeedsDisplay()
    }
    
    
}
