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
        
        viewModel.defaultWillLoad = {
            self.hudShow(message: "Projects.WillLoad".localized)
        }
        viewModel.defaultNetworkError = {
            self.errorAlert(message: "Projects.Error.Loading".localized)
        }
        viewModel.defaultResultError = viewModel.defaultNetworkError
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.allProjects {
            self.hudDismiss()
            self.table.reloadData()
        }
    }
    
    // MARK: -
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectsCount
    }
}
