//
//  TopCell.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 10.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

typealias TopCallback = (_ value: Bool) -> Void

class TopCell: UITableViewCell{
    
    @IBOutlet weak var startBtn: UILabel!
    
    private var isStarted = false
    
    private var _callBack: TopCallback? = nil
    
    func setup(callback: @escaping TopCallback){
        self._callBack = callback
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
        self.startBtn.isUserInteractionEnabled = true
        self.startBtn.addGestureRecognizer(gesture)
        self.selectionStyle = .none
    }
    
    @objc func tap(sender: UITapGestureRecognizer){
        self.isStarted = !isStarted
        self.startBtn.text = isStarted ? "Stop" : "Start"
        self._callBack?(self.isStarted)
    }
    
}
