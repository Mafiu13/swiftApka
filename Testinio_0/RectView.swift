//
//  RectView.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 27.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

protocol updatePhysicsDelegate {
    func changePanGesture(rectView: RectView)
    func finishPanGesture(rectView: RectView)
}

class RectView: UIView {
    
    private let size: CGFloat = 50.0
    private let cornerRadius: CGFloat = 10
    private let strokeWidth: CGFloat = 3
    
    private let colorStroke = UIColor.blackColor()
    
    var delegate: updatePhysicsDelegate?
    
    init(origin: CGPoint){
        super.init(frame: CGRectMake(0, 0, size, size))
        self.center = origin
        self.backgroundColor = UIColor.clearColor()
        initGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let insetRect = CGRectInset(rect, strokeWidth/2, strokeWidth/2)
        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRadius)
        randomColor().setFill()
        path.fill()
        path.lineWidth = strokeWidth
        colorStroke.setStroke()
        path.stroke()
        
    }
    
    func initGestureRecognizer(){
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
        addGestureRecognizer(panGR)
    }
    
    func pan(panGR: UIPanGestureRecognizer){

        self.superview?.bringSubviewToFront(self)
        var trans = panGR.translationInView(self)
        trans = CGPointApplyAffineTransform(trans, self.transform)
        self.center.x += trans.x
        self.center.y += trans.y
        panGR.setTranslation(CGPointZero, inView: self)
        if panGR.state == UIGestureRecognizerState.Changed{
            delegate?.changePanGesture(self)
        }
        else if panGR.state == UIGestureRecognizerState.Ended{
            delegate?.finishPanGesture(self)
        }
    }
    
    func randomColor() -> UIColor {
        //arc4random - daje floar  od 0 do UINT32_MAX
        let hue: CGFloat = CGFloat(Float(arc4random())/Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
    }
    
    
}
