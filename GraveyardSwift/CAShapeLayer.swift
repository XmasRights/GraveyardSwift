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
    private let kTitle  = "CAShapeLayer"
    private let kEdge   = CGFloat(30);
    
    private var progressBar: CAShapeProgressBar?
    private var actionButton = UIButton()
    
    override func formatCell(inout cell: CodeSampleCell)
    {
        cell.titleLabel.text = kTitle
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        constructProgressBar()
        constructActionButton()
        view.backgroundColor = UIColor.darkTurquoiseColour()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    
    private func constructProgressBar()
    {
        let size            = self.view.bounds.width - 2 * kEdge
        self.progressBar    = CAShapeProgressBar(frame: CGRectMake(kEdge, kEdge, size, size))
        
        if let progress = self.progressBar
        {
            self.view.addSubview(progress)
            
            self.view.addConstraint(NSLayoutConstraint(item: progress, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: progress, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: kEdge))
        }
    }
    
    private func constructActionButton()
    {
        self.view.addSubview(self.actionButton)
        self.actionButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.actionButton.setTitle("Animate", forState: UIControlState.Normal)
        self.actionButton.addTarget(self, action: "animateButtonPressed", forControlEvents:.TouchUpInside)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[button]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["button" : self.actionButton]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[button(40)]-16-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["button" : self.actionButton]))
    }
    
    func animateButtonPressed()
    {
        self.progressBar?.animate()
    }
    
}
