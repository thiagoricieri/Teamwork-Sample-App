//
//  TasksViewController.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class TasksViewController: BaseTableViewController {
    
    @IBOutlet var viewModel: TasksViewModel!
    
    var taskList: OneTaskListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = taskList.name
        self.table.estimatedRowHeight = TaskCell.height
        self.enableRefreshControl()
        
        viewModel.defaultNetworkError = { [weak self] in
            self?.errorAlert(message: "Tasks.Error.Loading".localized)
        }
        viewModel.defaultResultError = viewModel.defaultNetworkError
        viewModel.defaultWillLoad = { [weak self] in
            self?.hudShow(message: "Tasks.WillLoad".localized)
        }
        viewModel.tasks(of: taskList.id) { [weak self] in
            self?.hudDismiss()
            self?.table.reloadData()
        }
    }
    
    // MARK: - Refresh Control
    override func refreshData() {
        
        viewModel.defaultWillLoad = nil
        viewModel.tasks(of: taskList.id) { [weak self] in
            self?.table.reloadData()
            self?.endRefreshAnimation()
        }
    }
    
    // MARK: - Table View
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskCell.identifier) as! TaskCell
        
        let item = viewModel.one(at: indexPath.row)
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasksCount
    }
}
