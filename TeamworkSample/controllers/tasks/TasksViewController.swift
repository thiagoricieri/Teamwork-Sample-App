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
    
    var projectId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks.Title".localized
        
        viewModel.defaultWillLoad = {
            self.hudShow(message: "Tasks.WillLoad".localized)
        }
        viewModel.defaultNetworkError = {
            self.errorAlert(message: "Tasks.Error.Loading".localized)
        }
        viewModel.defaultResultError = viewModel.defaultNetworkError
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.tasks(of: projectId) {
            self.hudDismiss()
            self.table.reloadData()
        }
    }
    
    // MARK: -
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TaskCell.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.section(at: section).name
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskCell.identifier) as! TaskCell
        
        let item = viewModel.one(at: indexPath.row, section: indexPath.section)
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countTasks(section: section)
    }
}
