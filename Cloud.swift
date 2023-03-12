//
//  Cloud.swift
//  PreschoolEducation
//
//  Created by Sachin Shah on 16/02/2017.
//  Copyright © 2017 Sachin Shah. All rights reserved.
//

import UIKit

class Cloud: UIImageView {
    
    var startLocation: CGPoint?
    var newcenter: CGPoint?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        var newcenter = self.center
        let halfx = self.bounds.midX
        newcenter.x = max(halfx, newcenter.x)
        newcenter.x = min((self.superview?.bounds.size.width)! - halfx,
                          newcenter.x)
        let halfy = self.bounds.midY
        newcenter.y = max(halfy, newcenter.y)
        newcenter.y = min((self.superview?.bounds.size.height)! - halfy,
                          newcenter.y)
        // Set new location
        self.center = newcenter
        
    }
}
