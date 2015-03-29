//
//  CAShapeLayer.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class ShapeLayerCodeSample: CodeSampleViewController
{
    let kTitle = "CAShapeLayer"
    var progressBar: CAShapeProgressBar?
    
    override func formatCell(inout cell: CodeSampleCell)
    {
        cell.titleLabel.text = kTitle
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.blueColor()
        
        let margin          = CGFloat(10)
        let size            = self.view.bounds.width - 2 * margin
        self.progressBar    = CAShapeProgressBar(frame: CGRectMake(margin, margin, size, size))
        
        self.view.addSubview(progressBar!)
        
        if let progress = self.progressBar
        {
            self.view.addConstraint(NSLayoutConstraint(item: progress, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: progress, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: margin))
        }
        
        self.progressBar?.setProgress(0.5)
}
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
}
