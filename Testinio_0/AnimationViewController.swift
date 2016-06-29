//
//  AnimationViewController.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 27.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, updatePhysicsDelegate {
    
    private let physics = Physics()
    
    private var rectViews = [RectView]()
    
    var animating = false{
        didSet{
            if animating{
                animator?.addBehavior(physics)
            }
            else{
                animator?.removeBehavior(physics)
            }
        }
    }
    
    private var animator: UIDynamicAnimator?
    
    @IBOutlet weak var switchinio: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        
        let tapPoint = sender.locationInView(self.view)
        
        let rectView = RectView(origin: tapPoint)
        
        rectView.delegate = self
        
        self.view.addSubview(rectView)
        
        rectViews.append(rectView)
        
        physics.addItem(rectView)
        
    }
    
    func changePanGesture(rectView: RectView) {
        physics.removeItem(rectView)
        physics.addItemCollision(rectView)
    }
    func finishPanGesture(rectView: RectView) {
        physics.removeItem(rectView)
        physics.addItem(rectView)
    }
    
    @IBAction func switchGravitation(sender: UISwitch) {
        
                if sender.on{
                    animating = true
                }
                else{
                    animating = false
                }
    }
    @IBAction func resetRects() {
        
        switchinio.setOn(false, animated: true)
        animating = false
        
        for rectView in rectViews{
            physics.removeItem(rectView)
            rectView.removeFromSuperview()
        }
        rectViews.removeAll()
    }
}
