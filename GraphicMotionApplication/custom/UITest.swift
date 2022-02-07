//
//  UITest.swift
//  GraphicMotionApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/11.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit


@IBDesignable
class UITest: UIView {
    
    
    
    @IBInspectable var bC: UIColor = UIColor.black
    
    @IBInspectable var guideColor: UIColor = UIColor.gray
    
    @IBInspectable var graphicColor: UIColor = UIColor.white
    
    let sizeOfView: CGFloat = 200
    
    var graphicPath = UIBezierPath()
    
    let calc = CrossCalculator()
    
    let markSize = 2
    
    let guidesCount = 4
    
    
    
    
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
    }
    
    override func draw(_ rect: CGRect) {
        drawTest()
    }
    
    
    private func drawTest(){
        
        let array = [1,4,2,4,3,4,4,6,5,7,6,8,7,8,8,7,9,10]
        
        self.drawGuides(count: guidesCount, color: UIColor.gray)
        self.drawCenterLine(color: .white)
        
    
        self.drawGraphic(array: array)
        self.drawMarks(array: array)
        
    }
    
    
    private func drawGraphic(array: [Int]){
        
        let horizontalOffset = CGFloat(sizeOfView) / CGFloat(array.count)
        let verticalOffset = CGFloat(sizeOfView) / CGFloat(array.max()!)
        
        var startX: CGFloat = 0
        var startY: CGFloat = sizeOfView / 2
        var endX: CGFloat = 0
        var endY: CGFloat = 0
        
        for index in 0 ..< array.count + 1{
            
            if(index == array.count){
                endX = sizeOfView
                endY = sizeOfView / 2
            }else{
                endX = (CGFloat(index) * horizontalOffset) + (horizontalOffset / 2)
                endY = (CGFloat(array[index]) * verticalOffset ) - (verticalOffset / 2)
            }
            
            self.drawGraphicLine(
                start: CGPoint(x: startX , y:startY ),
                end: CGPoint(x: endX, y:endY),
                index: index
            )
            
            startX = endX
            startY = endY
        }
    }
    
    private func drawGraphicLine(start: CGPoint, end: CGPoint, index: Int){
        
        let center = sizeOfView / 2
        let centerPointStart = CGPoint(x: 0, y: center)
        let centerPointEnd = CGPoint(x: sizeOfView, y: center)
        
        if(crossesTheCentralLine(startY: start.y, newY: end.y)){
            let crossPoint = calc.linesCross(
                start1: start,
                end1: end,
                start2: centerPointStart,
                end2: centerPointEnd)!
        
                    
            self.drawLine(startCoords: CGPoint(x: start.x, y: start.y),
                          endCoords: CGPoint(x: crossPoint.x, y: crossPoint.y),
                          color: getColorForMultyLine(start: start.y, end: crossPoint.y))
            
            self.drawLine(startCoords: CGPoint(x: crossPoint.x, y: crossPoint.y),
                          endCoords: CGPoint(x: end.x, y: end.y),
                          color: getColorForMultyLine(start: crossPoint.y, end: end.y))
            
            return
        }
        
    
        self.drawLine(
            startCoords: CGPoint(x: start.x, y: start.y),
            endCoords: CGPoint(x: end.x, y: end.y),
            color: getColorForLinestartY(startY: start.y, endY: end.y))
    }
    
    
    private func drawMarks(array: [Int]){
        
        let horizontalOffset = CGFloat(sizeOfView) / CGFloat(array.count)
        let verticalOffset = CGFloat(sizeOfView) / CGFloat(array.max()!)
        
        for index in 0 ..< array.count{
            
            let model = array[index]
            
            let x = (CGFloat(index) * horizontalOffset) + (horizontalOffset / 2)
            let y = (CGFloat(model) * verticalOffset ) - (verticalOffset / 2)
            
            let coords = CGPoint(x: x, y: y)
            self.drawMark(point: coords, color: UIColor.white, size: CGFloat(markSize))
        }
        
    }
    
    private func drawLine(startCoords: CGPoint, endCoords: CGPoint, color: UIColor){
        color.setStroke()
        
        graphicPath = UIBezierPath()
        graphicPath.move(to: startCoords)
        graphicPath.addLine(to: endCoords)
        graphicPath.stroke()
        graphicPath.close()
    }
    
    private func drawCenterLine(color: UIColor){
        self.drawLine(
            startCoords: CGPoint(x: 0, y: sizeOfView / 2),
            endCoords: CGPoint(x: sizeOfView, y: sizeOfView / 2),
            color: color)
    }
    
    private func drawGuides(count: Int, color: UIColor){
        let offset = CGFloat(sizeOfView) / CGFloat(count)
        
        for index in 1 ..< count{
            let startY: CGFloat = CGFloat(index) * offset
            self.drawLine(
                startCoords: CGPoint(x: 0, y: startY),
                endCoords: CGPoint(x: sizeOfView, y: startY),
                color: color
            )
            
            let startX: CGFloat = CGFloat(index) * offset
            self.drawLine(
                startCoords: CGPoint(x: startX, y: 0),
                endCoords: CGPoint(x: startX, y: sizeOfView),
                color: color
            )
        }
    }

    
    private func drawMark(point: CGPoint, color: UIColor, size: CGFloat){
        let startX = point.x - size
        let startY = point.y - size
        let endX = point.x + size
        let endY = point.y + size
        
        self.drawLine(
            startCoords: CGPoint(x: startX, y: startY),
            endCoords: CGPoint(x: endX, y: endY),
            color: color)
        
        self.drawLine(
            startCoords: CGPoint(x: endX, y: startY),
            endCoords: CGPoint(x: startX, y: endY),
            color: color)
    }
    
    
    private func getColorForMultyLine(start: CGFloat, end: CGFloat) -> UIColor{
        let centerY = CGFloat(sizeOfView / 2)
        return (start > centerY || end > centerY) ? UIColor.red : UIColor.green
    }
    
    private func getColorForLinestartY(startY: CGFloat, endY: CGFloat) -> UIColor{
        let centerY = CGFloat(sizeOfView / 2)
        let middleAge = (startY + endY) / 2
        return middleAge > centerY ? UIColor.red : UIColor.green
    }
    
    private func crossesTheCentralLine(startY: CGFloat, newY: CGFloat) -> Bool{
        let centerY = CGFloat(sizeOfView / 2)
        return between(start: startY, end: newY, target: centerY) ||
               between(start: newY, end: newY, target: startY)
    }
    
    private func between(start: CGFloat, end: CGFloat, target: CGFloat) -> Bool{
        return start > target && end < target
    }
    
}
