//
//  ProjectsViewController.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class ProjectsViewController: BaseTableViewController,
        UISplitViewControllerDelegate{
    
    @IBOutlet var projectsViewModel: ProjectsViewModel!
    @IBOutlet var companyViewModel: CompanyViewModel!
    @IBOutlet var companyOverview: CompanyOverviewView!
    
    fileprivate func setupTableAndSplitView() {
        title = "Teamwork Sample"
        
        table.estimatedRowHeight = ProjectCell.height
        enableRefreshControl()
        
        splitViewController?.preferredDisplayMode = .allVisible
        splitViewController?.delegate = self
    }
    
    fileprivate func setupProjectsViewModel() {
        projectsViewModel.defaultNetworkError = { [weak self] in
            self?.errorAlert(message: "Projects.Error.Loading".localized)
        }
        projectsViewModel.defaultResultError = projectsViewModel.defaultNetworkError
        projectsViewModel.defaultWillLoad = { [weak self] in
            self?.hudShow(message: "Projects.WillLoad".localized)
        }
        projectsViewModel.allProjects { [weak self] in
            self?.hudDismiss()
            self?.table.reloadData()
        }
    }
    
    fileprivate func setupCompanyViewModel() {
        companyViewModel.getAccount { [weak self] in
            if let viewModel = self?.companyViewModel {
                self?.companyOverview.configure(with: viewModel)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableAndSplitView()
        setupProjectsViewModel()
        setupCompanyViewModel()
    }
    
    // MARK: - Refresh Control
    override func refreshData() {
        
        projectsViewModel.defaultWillLoad = nil
        projectsViewModel.allProjects { [weak self] in
            self?.table.reloadData()
            self?.endRefreshAnimation()
        }
    }
    
    // MARK: - Split View
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    // MARK: - Table View
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProjectCell.identifier) as! ProjectCell
        
        let item = projectsViewModel.one(at: indexPath.row)
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = projectsViewModel.one(at: indexPath.row)
        performSegue(withIdentifier: MainStoryboard.Segue.toTaskLists, sender: item)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsViewModel.projectsCount
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MainStoryboard.Segue.toTaskLists {
            let nc = segue.destination as! UINavigationController
            let dest = nc.viewControllers.first as! TaskListsViewController
            dest.project = sender as! OneProjectViewModel
        }
    }
}
