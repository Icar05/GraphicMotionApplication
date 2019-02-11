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

    
    
    var sizeOfView = 200

    
    
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
            self.backgroundColor = UIColor.green
        }
    }
    
    
    func setup(){
        self.layer.bounds.size = CGSize(width: CGFloat(sizeOfView), height: CGFloat(sizeOfView))
        backgroundColor = .red
        layer.cornerRadius = 20
    }


}
