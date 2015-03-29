//
//  CAShapeProgressBarView.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class CAShapeProgressBar: UIView
{
    private let progressLayer: CAShapeLayer = CAShapeLayer()
    private var progressLabel: UILabel
    
    // =============================================================
    // MARK: Initialisers
    // =============================================================
    
    required init(coder aDecoder: NSCoder)
    {
        progressLabel = UILabel()
        
        super.init()
        
        initProgressLayer()
        initLabel()
        
        self.backgroundColor = UIColor.redColor()
    }
    
    override init(frame: CGRect)
    {
        progressLabel = UILabel()
        
        super.init(frame: frame)
        
        initProgressLayer()
        initLabel()
    }
    
    private func initProgressLayer()
    {
        let startAngle  = CGFloat(M_PI_2)
        let endAngle    = CGFloat(M_PI * 2.5)
        let centrePoint = CGPointMake(  CGRectGetWidth(frame)/2 ,
                                        CGRectGetHeight(frame)/2)
        let edge        = CGFloat(30)
        let radius      = (CGRectGetWidth(frame) / 2) - edge
        
        
        var gradiantMask = gradientMask()
        
        progressLayer.path              = UIBezierPath( arcCenter: centrePoint,
                                                        radius: radius,
                                                        startAngle: startAngle,
                                                        endAngle: endAngle,
                                                        clockwise: true).CGPath
        progressLayer.backgroundColor   = UIColor.clearColor().CGColor
        progressLayer.fillColor         = nil
        progressLayer.strokeColor       = UIColor.blackColor().CGColor
        progressLayer.lineWidth         = 4.0
        progressLayer.strokeStart       = 0.0
        progressLayer.strokeEnd         = 0.0
        
        gradiantMask.mask = progressLayer
        layer.addSublayer(gradiantMask)
        
    }
    
    private func initLabel()
    {
        progressLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(frame), 60.0))
        progressLabel.textColor = .whiteColor()
        progressLabel.textAlignment = .Center
        progressLabel.text = ""
        progressLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40.0)
        progressLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(progressLabel)
        
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: progressLabel, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: progressLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    private func gradientMask() -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        gradientLayer.locations = [0.0, 1.0]
        
        let colorTop: AnyObject = UIColor(red: 0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
        let colorBottom: AnyObject = UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 5.0/255.0, alpha: 1.0).CGColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    // =============================================================
    // MARK: Animators
    // =============================================================
    
    func hide()
    {
        progressLayer.strokeEnd = 0.0
        progressLayer.removeAllAnimations()
        progressLabel.text = ""
    }
    
    func animate()
    {
        progressLabel.text = "Animating"
        progressLayer.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue     = CGFloat(0.0)
        animation.toValue       = CGFloat(1.0)
        animation.duration      = 1.0
        animation.delegate      = self
        animation.removedOnCompletion = false
        animation.additive      = true
        animation.fillMode      = kCAFillModeForwards
        progressLayer.addAnimation(animation, forKey: "strokeEnd")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool)
    {
        progressLabel.text = "Done"
    }
    
    // =============================================================
    // MARK: Manual Animators
    // =============================================================
    
    func setProgress(progress : CGFloat)
    {
        progressLayer.strokeEnd = progress
        progressLayer.removeAllAnimations()

        let percentInt      = Int(progress * 100)
        let percentString   = String(percentInt) + "%"
        
        progressLabel.text  = percentString
    }
}
