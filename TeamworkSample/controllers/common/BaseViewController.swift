//
//  BaseViewController.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {
    fileprivate(set) var currentHud: MBProgressHUD?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Style
extension BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bar = navigationController?.navigationBar {
            bar.barStyle = .blackTranslucent
            bar.barTintColor = Visuals.navigationBarColorDark
            bar.tintColor = Visuals.tintColor
            bar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            bar.isTranslucent = false
            bar.titleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white
            ]
        }
    }
}

// MARK: - HUD
extension BaseViewController {
    
    func hudShow (message: String? = nil) {
        currentHud = MBProgressHUD.showAdded(to: self.view, animated: true)
        currentHud?.mode = .indeterminate
        
        if message != nil {
            currentHud?.label.text = message!
        }
    }
    
    func hudDismiss() {
        if currentHud != nil {
            currentHud?.hide(animated: true)
            currentHud = nil
        }
    }
}

// MARK: - Alerts
extension BaseViewController {
    func alertViewWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func errorAlert(message: String) {
        alertViewWithTitle(title: "Warning".localized, message: message)
    }
    
    func successAlert(message: String) {
        alertViewWithTitle(title: "Success".localized, message: message)
    }
}
