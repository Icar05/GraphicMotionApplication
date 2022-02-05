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
    
    var sizeOfView: CGFloat = 200
    
    let guidesCount = 9
    
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
    }
    
    override func draw(_ rect: CGRect) {
        drawGuideLines()
        drawLines()
    }
    
    
    private func drawLines(){

        
        let tempHeight = (sizeOfView / 3 ) - 10
        let tempWidth = sizeOfView / 3
        
        
        self.drawLine(startCoords: CGPoint(x: 0, y: tempHeight),
                      endCoords: CGPoint(x: tempWidth, y: tempHeight),
                      color: UIColor.red)
        
        self.drawLine(startCoords: CGPoint(x: tempWidth, y: tempHeight * 2),
                      endCoords: CGPoint(x: tempWidth * 2, y: tempHeight * 2),
                      color: UIColor.yellow)
        
        self.drawLine(startCoords: CGPoint(x: tempWidth * 2, y: tempHeight * 3),
                      endCoords: CGPoint(x: tempWidth * 3, y: tempHeight * 3),
                      color: UIColor.green)
        
        
    }
    
    private func drawLine(startCoords: CGPoint, endCoords: CGPoint, color: UIColor){
        color.setStroke()
        
        graphicPath = UIBezierPath()
        graphicPath.move(to: startCoords)
        graphicPath.addLine(to: endCoords)
        graphicPath.stroke()
        graphicPath.close()
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
    
    
    private func getColorForLinestartY(startY: CGFloat, newY: CGFloat) -> UIColor{
       
        
        let centerY = CGFloat(sizeOfView / 2)
        
        print("start: \(startY), end: \(newY), center: \(centerY)")
        
        if(startY > centerY && newY > centerY){
            print("red")
            return UIColor.red
        }
        
        if(startY < centerY && newY < centerY){
            print("green")
            return UIColor.green
        }
        
        print("yellow")
        return UIColor.yellow
    }
    
    private func crossesTheCentralLine(startY: CGFloat, newY: CGFloat) -> Bool{
        
        let centerY = CGFloat(sizeOfView / 2)
      
        if(startY > centerY && newY > centerY){
            return true
        }
        
        if(startY < centerY && newY < centerY){
            return true
        }
        
        return false
    }


}
