//
//  UIGraphicView.swift
//  GraphicMotionApplication
//
//  Created by Eddson on 08.02.2019.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

protocol Graphic{
    func pushValue(value: Int) throws
    func setupWithArray(values: [Int]) throws
    func getUIView() -> UIView
}

@IBDesignable
class UIGraphicView: UIView, Graphic {
   
    
    
   
    
    @IBInspectable var bC: UIColor = UIColor.black
    
    @IBInspectable var guideColor: UIColor = UIColor.gray
    
    @IBInspectable var graphicColor: UIColor = UIColor.orange
    
    private let defaultDataSourceCount = 50
    
    private let sizeOfView: CGFloat = 150
    
    private let guidesCount = 9
    
    private let horizontalOffset = 20
    
    private let maxDataSourceCount = 50
    
    private var startPointX: CGFloat = 0
    
    private var startPointY: CGFloat = 0
    
    private var stepInPixel: CGFloat = 0
    
    private var datasource: Queue<Int> = Queue()
    
    private var graphicPath = UIBezierPath()
    
    private var guidePath = UIBezierPath()
    
    
    
    
    
    
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
    
    override func layoutSubviews() {
            super.layoutSubviews()
            self.frame = bounds
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
        graphicColor.setStroke()
        
        for i: Int in datasource.getElements() {
            
            graphicPath.move(to: CGPoint(x:startPointX, y:startPointY))
            
            startPointX = startPointX + stepInPixel
            startPointY = calculateStepHeight(value: i)
            
            graphicPath.addLine(to: CGPoint(x: startPointX, y:startPointY))
            graphicPath.stroke()
            
        }
        
        graphicPath.close()
    }
    
    private func calculateStepHeight(value: Int) -> CGFloat{
        return CGFloat(value) * stepInPixel
    }
    
    
    private func createEmptyValues(count: Int) -> [Int]{
        return [1,4,2,4,3,4,4,6,5,7,6,8,7,8,8,7,9,10]
    }
    
    func pushValue(value: Int){
        self.datasource.push(value)
        self.layer.sublayers = nil
        self.graphicPath = UIBezierPath()
        self.setNeedsDisplay()
    }
    
    
    func setupWithArray(values: [Int]) throws {
        if(values.count > defaultDataSourceCount){
            throw RuntimeError("too many start elements")
        }
        
        self.datasource.setup(values)
        self.layer.sublayers = nil
        self.graphicPath = UIBezierPath()
        self.setNeedsDisplay()
    }
    
    func getUIView() -> UIView {
        return self
    }
    
}
