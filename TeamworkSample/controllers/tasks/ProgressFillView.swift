//
//  ProgressFillView.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class ProgressFillView: UIView {
    
    var progress = 0 {
        didSet { setNeedsDisplay() }
    }
    var progressLayer: CAShapeLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clearsContextBeforeDrawing = true
    }
    
    override func draw(_ rect: CGRect) {
        if progressLayer != nil {
            progressLayer!.removeFromSuperlayer()
        }
        
        if progress > 0 {
            progressLayer = CAShapeLayer()
            
            let maxWidth = self.bounds.width
            let drawWidth = maxWidth * CGFloat(progress) / 100
            let rect = UIBezierPath(
                roundedRect: CGRect(x: 0, y: 0, width: drawWidth, height: self.bounds.height),
                cornerRadius: 0)
            
            progressLayer!.path = rect.cgPath
            progressLayer!.fillColor = Visuals.Tasks.progressColor.cgColor
            layer.addSublayer(progressLayer!)
        }
    }
}
