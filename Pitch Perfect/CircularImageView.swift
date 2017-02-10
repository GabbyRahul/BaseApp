//
//  CircularImageView.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 08/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImageView: UIView {

    
    @IBInspectable var backgroundLayerColor: UIColor = UIColor.clear
    @IBInspectable var lineWidth: CGFloat = 1.0
    
    var imageLayer: CALayer!
    @IBInspectable var image: UIImage?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBackgroundLayer()
        setBackgroundImageLayer()
        setImage()
    }
    
    func setBackgroundLayer() {
        
        if backgroundLayer == nil {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
            let rect = bounds.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
            let path = UIBezierPath(ovalInRect: rect)
            backgroundLayer.path = path.CGPath
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.fillColor = backgroundLayerColor.CGColor
        }
        
        backgroundLayer.frame = layer.bounds
    }
    
    
    func setBackgroundImageLayer() {
        
        if imageLayer == nil {
            let mask = CAShapeLayer()
            let dx = lineWidth + 3.0
            let path = UIBezierPath(ovalInRect: CGRectInset(self.bounds, dx, dx))
            mask.fillColor = UIColor.blackColor().CGColor
            mask.path = path.CGPath
            mask.frame = self.bounds
            layer.addSublayer(mask)
            imageLayer = CAShapeLayer()
            imageLayer.frame = self.bounds
            imageLayer.mask = mask
            imageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(imageLayer)
        }
        
    }
    
    func setImage() {
        if let pic = image {
            imageLayer.contents = pic.CGImage
        }
    }

}
