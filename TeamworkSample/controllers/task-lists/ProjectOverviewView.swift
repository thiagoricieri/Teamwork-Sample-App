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

class ProjectOverviewView: UIView {
    
    @IBOutlet weak var projectLogo: UIImageView!
    @IBOutlet weak var startBadge: DateBadgeView!
    @IBOutlet weak var endBadge: DateBadgeView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    }
}
