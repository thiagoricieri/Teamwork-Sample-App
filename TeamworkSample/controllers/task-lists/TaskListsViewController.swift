//
//  TaskListsViewController.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class TaskListsViewController: BaseTableViewController {
    
    @IBOutlet var viewModel: TaskListsViewModel!
    @IBOutlet weak var projectOverview: ProjectOverviewView!
    @IBOutlet weak var noProjectLabel: UILabel!
    
    var project: OneProjectViewModel?
    
    fileprivate func setupTableAndSplitView() {
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        
        table.estimatedRowHeight = TaskListCell.height
        table.isHidden = self.project == nil
        noProjectLabel.isHidden = !table.isHidden
        noProjectLabel.text = "TaskLists.NoProject".localized
        
        enableRefreshControl()
    }
    
    fileprivate func setupViewModel() {
        
        if let project = self.project {
            
            title = project.name
            projectOverview.configure(with: project)
            
            viewModel.defaultNetworkError = { [weak self] in
                self?.errorAlert(message: "TaskLists.Error.Loading".localized)
            }
            viewModel.defaultResultError = viewModel.defaultNetworkError
            viewModel.defaultWillLoad = { [weak self] in
                self?.hudShow(message: "TaskLists.WillLoad".localized)
            }
            viewModel.lists(of: project.id) { [weak self] in
                self?.hudDismiss()
                self?.table.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableAndSplitView()
        setupViewModel()
    }
    
    // MARK: - Refresh Control
    override func refreshData() {
        
        viewModel.defaultWillLoad = nil
        viewModel.lists(of: project!.id) { [weak self] in
            self?.table.reloadData()
            self?.endRefreshAnimation()
        }
    }
    
    // MARK: - Table View
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskListCell.identifier) as! TaskListCell
        
        let item = viewModel.one(at: indexPath.row)
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.one(at: indexPath.row)
        performSegue(withIdentifier: MainStoryboard.Segue.toTasks, sender: item)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listsCount
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MainStoryboard.Segue.toTasks {
            let dest = segue.destination as! TasksViewController
            dest.taskList = sender as! OneTaskListViewModel
        }
    }
}
