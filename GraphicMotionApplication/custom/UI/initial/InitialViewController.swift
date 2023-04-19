//
//  InitialViewController.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class InitialViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension UIViewController{
    func setupNavbar(title: String){
        
        let textColor = UIColor.white
        let backgroundColor = UIColor.black
        
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        self.title =  title
        
        self.navigationController?.navigationBar.tintColor = textColor
        self.navigationItem.backButtonDisplayMode = .minimal
    }
}
