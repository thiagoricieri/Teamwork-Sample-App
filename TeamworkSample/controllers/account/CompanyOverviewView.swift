//
//  CompanyOverviewView.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CompanyOverviewView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var allProjectsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = "Loading".localized
        companyNameLabel.text = "Account.Fetching".localized
    }
    
    func configure(with company: CompanyViewModel) {
        nameLabel.text = company.account.name
        companyNameLabel.text = company.account.companyName
        companyLogo.sd_setImage(with: company.account.logo)
    }
}
