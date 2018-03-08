//
//  TimeZonesTableViewController.swift
//  time-zones
//
//  Created by Xavier Briole on 01/12/2017.
//  Copyright © 2017 Xavier Briole. All rights reserved.
//

import UIKit

class TimeZonesTableViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Core.shared.time { [unowned self] time in
            self.timeLabel.text = time
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
