//
//  ProjectOverviewView.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import TagListView

class ProjectOverviewView: UIView {
    
    @IBOutlet weak var projectLogo: UIImageView!
    @IBOutlet weak var startBadge: DateBadgeView!
    @IBOutlet weak var endBadge: DateBadgeView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var taskListsLabel: UILabel!
    @IBOutlet weak var tagListHeight: NSLayoutConstraint!
    @IBOutlet weak var tagListView: TagListView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        taskListsLabel.text = "TaskLists.All".localized
        tagListView.textFont = UIFont.systemFont(ofSize: 17.0)
        
        projectLogo.layer.shadowColor = UIColor.black.cgColor
        projectLogo.layer.shadowRadius = 6
        projectLogo.layer.shadowOffset = CGSize(width: 0, height: 6)
        projectLogo.layer.shadowOpacity = 0.5
    }
    
    func configure(with project: OneProjectViewModel) {
        projectLogo.sd_setImage(with: project.logoUrl)
        startBadge.configure(with: project.startDate, type: .start)
        endBadge.configure(with: project.endDate, type: .end)
        descriptionLabel.text = project.projectDescription
        tagListView.addTags(project.tagsNames)
    }
}
