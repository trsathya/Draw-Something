//
//  MyView.swift
//  DrawSomething
//
//  Created by Sathya Rajaraman on 3/18/16.
//  Copyright © 2016 Sathyakumar. All rights reserved.
//

import UIKit

class MyView : UIView {
    
    var segments : Array<Array<CGPoint>> = []
    var tempSegment : Array<CGPoint> = []
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            tempSegment.append(point)
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            tempSegment.append(point)
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            endTouch(point)
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        guard let touches = touches, let point = touches.first?.locationInView(self) else {
            return
        }
        endTouch(point)
    }
    
    func endTouch(point : CGPoint) {
        tempSegment.append(point)
        segments.append(tempSegment)
        tempSegment = []
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let myBezier = UIBezierPath()
        for segment in segments {
            myBezier.appendPath(bezierForsegment(segment))
        }
        myBezier.appendPath(bezierForsegment(tempSegment))
        myBezier.lineWidth = 2.0
        myBezier.stroke()
    }
    
    func bezierForsegment(segment : Array<CGPoint>) -> UIBezierPath {
        let innerBezier = UIBezierPath()
        for (index, point) in segment.enumerate() {
            if index == 0 {
                innerBezier.moveToPoint(point)
            } else {
                innerBezier.addLineToPoint(point)
            }
        }
        return innerBezier
    }
    
    func clear() {
        segments = []
        setNeedsDisplay()
    }
}
