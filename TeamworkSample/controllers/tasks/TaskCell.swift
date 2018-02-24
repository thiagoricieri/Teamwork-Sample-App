//
//  TaskCell.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class TaskCell: BaseTableViewCell {
    
    static let height = CGFloat(80)
    static let identifier = "TaskCell"
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var responsibleLabel: UILabel!
    
    func configure(with task: OneTaskViewModel) {
        contentLabel.text = task.content
        responsibleLabel.text = task.responsiblePartyName
    }
}
