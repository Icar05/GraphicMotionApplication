//
//  MainController.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import GraphicLB

public final class  MainController: UIViewController {
    
    
    private let sources: [String] = [
        String(describing: UIGraphicView.self),
        String(describing: UIModernGraphicView.self),
        String(describing: UIDoubleColorGraphic.self),
        String(describing: UIDoubleGraphic.self),
        String(describing: UIEqualizer.self),
    ]
    
    
    private let dataSource = MainDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        
        super.init(nibName: "MainController", bundle: Bundle.main)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Current graphics"
        self.setupTableView()
        self.dataSource.setData(data: sources.map{ MainCellModel(title: $0)})
        self.dataSource.callback = { [weak self] value in
            print("item: \(value)")
        }
        
    }
    
    
    private func setupTableView(){
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView()
        self.tableView.register(
            UINib(nibName: String(describing: MainViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: MainViewCell.self)
        )
    }

 

}
