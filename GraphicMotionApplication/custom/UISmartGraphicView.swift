//
//  UISmartGraphicView.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 04.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

import UIKit


@IBDesignable
class UISmartGraphicView: UIView {
    
    
    
    @IBInspectable var bC: UIColor = UIColor.black
    
    @IBInspectable var guideColor: UIColor = UIColor.gray
    
    @IBInspectable var positiveColor: UIColor = UIColor.green
    
    @IBInspectable var negativeColor: UIColor = UIColor.red
    
    let sizeOfView: CGFloat = 200
    
    let guidesCount = 9
    
    let defaultDataSourceCount = 50
    
    var startPointX: CGFloat = 0
    
    var startPointY: CGFloat = 0
    
    var verticalOffset: CGFloat = 0
    
    var horizontalOffset: CGFloat = 0
    
    var maxDataSourceValue: CGFloat = 0
    
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
        self.setupDefaultData()
    }
    
    private func calculateDataSourceValues(){
        self.maxDataSourceValue = CGFloat(self.datasource.getElements().max()!)
        self.verticalOffset =  CGFloat(sizeOfView) / self.maxDataSourceValue
        self.horizontalOffset = CGFloat(sizeOfView) / CGFloat(self.datasource.count())
    }
    
    override func draw(_ rect: CGRect) {
        drawGuideLines()
        drawGraphic()
    }
    
    
    private func drawGuideLines(){
        
        guideColor.setStroke()
        
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
        
        self.startPointX = 0
        self.startPointY = 0
        
        for (index, element) in datasource.getElements().enumerated() {
            
            self.startPointY = calculateVerticalCoord(value: element) - (verticalOffset / 2)
            self.startPointX =  calculateHorizontalCoord(index: index)
            
            self.drawLine(
                start: CGPoint(x: startPointX, y: startPointY),
                end: CGPoint(x: startPointX + horizontalOffset, y: startPointY),
                color: getColorForLinestartY(startY: startPointY, endY:startPointY))
            
            
            if(index + 1 < datasource.count()){
                let nextValue = datasource.getElement(index: index + 1)
                let newCoordY = calculateVerticalCoord(value: nextValue) - (verticalOffset / 2)
                
                if(crossesTheCentralLine(startY: startPointY, newY: newCoordY)){
                    self.drawMultyLines(
                        start: CGPoint(x: startPointX + horizontalOffset, y: startPointY),
                        end: CGPoint(x: startPointX + horizontalOffset, y: newCoordY))
                }else{
                    self.drawLine(
                        start: CGPoint(x: startPointX + horizontalOffset, y: startPointY),
                        end: CGPoint(x: startPointX + horizontalOffset, y: newCoordY),
                        color: getColorForLinestartY(startY: startPointY, endY:startPointY))
                }
                
            }
        }
        
    }
    
    
    
    private func drawMultyLines(start: CGPoint, end: CGPoint){
        
        self.drawLine(start: CGPoint(x: start.x, y: start.y),
                      end: CGPoint(x: start.x, y: sizeOfView / 2),
                      color: getColorForMultyLine(startY: start.y, endY:sizeOfView / 2))

        
        self.drawLine(start: CGPoint(x: end.x, y: sizeOfView / 2),
                      end: CGPoint(x: end.x, y: end.y),
                      color: getColorForMultyLine(startY: sizeOfView / 2, endY:end.y))
    }
    
    
    
    private func drawLine(start: CGPoint, end: CGPoint, color: UIColor){
        color.setStroke()
        
        graphicPath = UIBezierPath()
        graphicPath.move(to: start)
        graphicPath.addLine(to: end)
        graphicPath.stroke()
        graphicPath.close()
    }
    
    
    private func crossesTheCentralLine(startY: CGFloat, newY: CGFloat) -> Bool{
        let centerY = CGFloat(sizeOfView / 2)
        return between(start: startY, end: newY, target: centerY) ||
               between(start: newY, end: startY, target: centerY)
    }
    
    private func between(start: CGFloat, end: CGFloat, target: CGFloat) -> Bool{
        return start > target && end < target
    }
    
    private func getColorForMultyLine(startY: CGFloat, endY: CGFloat) -> UIColor{
        let centerY = CGFloat(sizeOfView / 2)
        return (startY > centerY || endY > centerY) ? negativeColor : positiveColor
    }
    
    private func getColorForLinestartY(startY: CGFloat, endY: CGFloat) -> UIColor{
        let centerY = CGFloat(sizeOfView / 2)
        let middleAge = (startY + endY) / 2
        return middleAge > centerY ? negativeColor : positiveColor
    }
    
    private func calculateHorizontalCoord(index: Int) -> CGFloat{
        return (CGFloat(index ) * horizontalOffset )
    }
    
    private func calculateVerticalCoord(value: Int) -> CGFloat{
        return CGFloat(value) * verticalOffset
    }
    
    private func setupDefaultData(){
        let values = [1,4,2,4,3,4,4,6,5,7,6,8,7,8,8,7,9,10]
        self.datasource.setup(values)
        self.calculateDataSourceValues()
    }
    
    func pushValue(value: Int) throws {
        
        if(CGFloat(value) > maxDataSourceValue){
            throw RuntimeError("wrong value: \(value) -> max: \(maxDataSourceValue)")
        }
        
        self.datasource.push(value)
        self.layer.sublayers = nil
        self.graphicPath = UIBezierPath()
        self.setNeedsDisplay()
        
        print(datasource)
    }
    
    
    func setupWithArray(values: [Int]) throws {
        
        if(values.count > defaultDataSourceCount){
            throw RuntimeError("too many start elements")
        }
        
        self.datasource.setup(values)
        self.calculateDataSourceValues()
        self.layer.sublayers = nil
        self.graphicPath = UIBezierPath()
        self.setNeedsDisplay()
    }
    
}
