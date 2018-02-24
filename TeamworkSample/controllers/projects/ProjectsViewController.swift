//
//  ProjectsViewController.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class ProjectsViewController: BaseTableViewController {
    
    @IBOutlet var viewModel: ProjectsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Projects.Title".localized
        
        viewModel.defaultNetworkError = { [weak self] in
            self?.errorAlert(message: "Projects.Error.Loading".localized)
        }
        viewModel.defaultResultError = viewModel.defaultNetworkError
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.enableRefreshControl()
        
        viewModel.defaultWillLoad = { [weak self] in
            self?.hudShow(message: "Projects.WillLoad".localized)
        }
        viewModel.allProjects { [weak self] in
            self?.hudDismiss()
            self?.table.reloadData()
        }
    }
    
    // MARK: - Refresh Control
    override func refreshData() {
        
        viewModel.defaultWillLoad = nil
        viewModel.allProjects { [weak self] in
            self?.table.reloadData()
            self?.endRefreshAnimation()
        }
    }
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProjectCell.height
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProjectCell.identifier) as! ProjectCell
        
        let item = viewModel.one(at: indexPath.row)
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.one(at: indexPath.row)
        performSegue(withIdentifier: MainStoryboard.Segue.toTaskLists, sender: item)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectsCount
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MainStoryboard.Segue.toTaskLists {
            let dest = segue.destination as! TaskListsViewController
            dest.project = sender as! OneProjectViewModel
        }
    }
}
