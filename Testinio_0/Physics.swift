//
//  Physics.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 27.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

class Physics: UIDynamicBehavior{
    
    private let gravity: UIGravityBehavior = {
        let gravity = UIGravityBehavior()
        gravity.magnitude = 2
        return gravity
    }()
    
    private let colider: UICollisionBehavior = {
        let colider = UICollisionBehavior()
        colider.translatesReferenceBoundsIntoBoundary = true
        return colider
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(colider)
    }
    
    func addItem(item: UIDynamicItem){
        gravity.addItem(item)
        colider.addItem(item)
    }
    
    func removeItem(item: UIDynamicItem){
        gravity.removeItem(item)
        colider.removeItem(item)
    }
    
    func addItemGravity(item: UIDynamicItem){
        gravity.addItem(item)
    }
    
    func addItemCollision(item: UIDynamicItem){
        colider.addItem(item)
    }
    
    func removeItemGravity(item: UIDynamicItem){
        gravity.removeItem(item)
    }
    
    func removeItemCollision(item: UIDynamicItem){
        colider.removeItem(item)
    }
    
    
}
