//
//  UIPedroView.swift
//  GraphicMotionApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/09.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

@IBDesignable
class UIPedroView: UIView {
    
    var size = 200
    
    
    
    override var bounds: CGRect {
        didSet {
            self.frame = CGRect(x: 0, y: 0, width: size, height: size)
            self.backgroundColor = UIColor.orange
        }
    }

    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }
    
    override func draw(_ rect: CGRect) {
          layer.cornerRadius = 20
    }
    

}
