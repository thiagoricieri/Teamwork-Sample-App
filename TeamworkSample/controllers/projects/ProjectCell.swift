//
//  ProjectCell.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class ProjectCell: BaseTableViewCell {
    
    static let height = CGFloat(150)
    static let identifier = "ProjectCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startToEndDate: UILabel!
    
    func configure(with project: OneProjectViewModel) {
        nameLabel.text = project.name
        descriptionLabel.text = project.projectDescription
        startToEndDate.text = project.startToEndDate
        
        accessoryType = UIDevice.current.userInterfaceIdiom == .phone ?
            .disclosureIndicator : .none
    }
}
