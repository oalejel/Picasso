//
//  ViewController.swift
//  Picasso
//
//  Created by Omar Alejel on 12/20/15.
//  Copyright © 2015 Omar Alejel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var color = UIColor.redColor()

    @IBOutlet weak var radiusSlider: UISlider!

    @IBAction func buttonPressed(sender: UIButton) { 
        color = sender.titleLabel!.textColor
    }
   
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first
        let loc = t?.locationInView(view)
        let p = UIBezierPath(arcCenter: loc!, radius: CGFloat(radiusSlider.value), startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: false)
        let shape = CAShapeLayer()
        shape.path = p.CGPath
        shape.fillColor = color.CGColor
        view.layer.addSublayer(shape)
    }

    @IBAction func tap(sender: AnyObject) {
        for layer in view.layer.sublayers! {
            if layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
    }

}

