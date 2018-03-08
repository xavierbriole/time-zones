//
//  Core.swift
//  time-zones
//
//  Created by Xavier Briole on 01/12/2017.
//  Copyright © 2017 Xavier Briole. All rights reserved.
//

import UIKit
import SwiftDate

class Core {
    
    static let shared = Core()

    let timeZone = "Asia/Tokyo"
    
    private init() {
        
    }
    
    private func getTime() -> String {
        let tz = TimeZone(identifier: self.timeZone)!
        let region = Region(tz: tz, loc: Locale.current)
        return Date().string(dateStyle: .long, timeStyle: .medium, in: region)
    }
    
    
    func time(_ block: @escaping (String)->Void) {
        let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
            if let _self = self {
                block(_self.getTime())
            } else {
                timer.invalidate()
            }
        }
        block(self.getTime())
    }
}
