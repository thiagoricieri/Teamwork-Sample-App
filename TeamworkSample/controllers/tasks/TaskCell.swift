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
    
    static let height = CGFloat(100)
    static let identifier = "TaskCell"
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var responsibleLabel: UILabel!
    @IBOutlet weak var startToEndDateLabel: UILabel!
    @IBOutlet weak var progressView: ProgressFillView!
    
    func configure(with task: OneTaskViewModel) {
        contentLabel.text = task.content
        startToEndDateLabel.text = task.startToEndDate
        
        let responsibleString = NSMutableAttributedString()
        if task.responsiblePartyName != "Tasks.Responsible.Anyone".localized {
            responsibleString.append(
                ownerAttributes(string: task.responsiblePartyName))
        }
        else {
            responsibleString.append(
                NSAttributedString(string: "Tasks.Responsible.Anyone".localized))
        }
        responsibleLabel.attributedText = responsibleString
        progressView.progress = task.progress
        
        self.accessoryType = task.completed ? .checkmark : .none
    }
    
    fileprivate func ownerAttributes(string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)
        ])
    }
}
