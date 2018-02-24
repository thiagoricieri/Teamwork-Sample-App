//
//  BaseTableViewController.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: BaseViewController,
        UITableViewDelegate,
        UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - View Stack
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    func enableRefreshControl() {
        table.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshControlPulled(_:)), for: .valueChanged)
    }
    
    @objc private func refreshControlPulled(_ sender: Any) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        refreshData()
    }
    
    func refreshData() {
    }
    
    func endRefreshAnimation() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.refreshControl.endRefreshing()
    }
    
    // MARK: - Table Delegate
    func reload() {
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return BaseTableViewCell()
    }
}
