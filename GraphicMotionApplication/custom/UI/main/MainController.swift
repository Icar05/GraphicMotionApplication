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
    
    
    private let presenter: MainPresenter
        
    private let dataSource = MainDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(presenter: MainPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "MainController", bundle: Bundle.main)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Current graphics"
        self.setupTableView()
        self.dataSource.callback = { [weak self] value in
            guard let self = self else { return }
            self.showGraphicInfo(value)
        }
        
        self.presenter.viewDidLoad()
        
    }
    
    public func registerCells(_ models: [MainModel]){
        models.forEach{
            self.tableView.register(
                UINib(nibName: $0.reuseIdentifier, bundle: nil),
                forCellReuseIdentifier: $0.reuseIdentifier
            )
        }
        self.dataSource.setData(data: models)
        self.tableView.reloadData()
    }
    
    private func showGraphicInfo(_ model: MainCellModel){
        let presener = DetailPresenter(model: model.model)
        let vc = DetailController(presenter: presener)
            presener.set(view: vc)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupTableView(){
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView()
    }

    

}
