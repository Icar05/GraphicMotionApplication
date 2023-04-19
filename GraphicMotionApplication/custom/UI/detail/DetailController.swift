//
//  DetailController.swift
//  GraphicMotionApplication
//
//  Created by Галяткин Александр on 19.04.2023.
//  Copyright © 2023 ipinguin_linuxoid. All rights reserved.
//


import UIKit

public final class DetailController: UIViewController {
    
    
    
    private let dataSource = DetailDataSource()
    
    private let presenter: DetailPresenter
    
    @IBOutlet weak var tableView: UITableView!
    
 

    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "DetailController", bundle: Bundle.main)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView()

        self.presenter.viewDidLoad()
    }
    
    
    func setTitle(_ title: String){
        self.title = title
    }
    
    func registerCells(models: [DetailModel]){
        
        models.forEach{
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: nil)
            self.tableView?.register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        
        self.dataSource.setData(data: models)
        self.tableView.reloadData()
    }
    

    
}
