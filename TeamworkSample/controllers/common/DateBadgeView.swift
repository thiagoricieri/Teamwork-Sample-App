//
//  DateBadgeView.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class DateBadgeView: UIView {
    
    enum DateType {
        case start
        case end
    }
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.bounds.width/2
        self.layer.borderColor = Visuals.Projects.badgeBorderColor.cgColor
        self.layer.borderWidth = CGFloat(6)
        
        dateLabel.text = ""
        yearLabel.text = ""
    }
    
    func configure(with date: Date?, type: DateType) {
        typeLabel.text = (type == .start ? "TaskLists.Date.Start" : "TaskLists.Date.End").localized
        
        if let validDate = date {
            dateLabel.text = DateUtils.monthDayFormat(validDate)
            yearLabel.text = DateUtils.yearFormat(validDate)
        }
    }
}
