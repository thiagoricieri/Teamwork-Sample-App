//
//  TaskListCell.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class TaskListCell: BaseTableViewCell {
    
    static let height = CGFloat(60)
    static let identifier = "TaskListCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(with taskList: OneTaskListViewModel) {
        nameLabel.text = taskList.name
        descriptionLabel.text = taskList.listDescription
    }
}
