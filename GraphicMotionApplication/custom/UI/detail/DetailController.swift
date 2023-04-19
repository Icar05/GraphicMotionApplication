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
        self.tableView.estimatedRowHeight = UITableView.automaticDimension

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
    

    func updateTitleForButton(isStarted: Bool){
       
        guard let cellWithButton = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? DetailCell,
              let actionCell = cellWithButton as? DetailActionCell else {
            return
        }
        
        actionCell.updateTitle(isStarted)
    }
    
    func updateValueForGraphic(_ value: Int){
        guard let cellWithButton = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? DetailCell,
              let graphicCell = cellWithButton as? DetailViewCell else {
            return
        }
        
        graphicCell.updateViewWithValue(value)
    }
    
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            self.presenter.onExitController()
        }
    }
}
