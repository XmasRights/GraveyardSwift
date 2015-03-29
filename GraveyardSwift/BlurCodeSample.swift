//
//  BlurCodeSample.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

extension UIBlurEffectStyle
{
    static let allValues = [ExtraLight, Light, Dark]
    static let rawValues = ["ExtraLight", "Light", "Dark"]
}

class BlurCodeSample : CodeSampleViewController
{
    private var imageView: UIImageView?
    private var effectView: UIVisualEffectView?
    private var controlButton: UISegmentedControl?
    
    override func formatCell(inout cell: CodeSampleCell)
    {
        cell.titleLabel.text        = "Blur"
        cell.imageView.image        = UIImage(named: "BlueFlower.jpg")
        cell.imageView.contentMode  = .ScaleAspectFit
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        loadImageView()
        loadSegControl()
    }
    
    private func loadImageView()
    {
        self.imageView = UIImageView(image: UIImage(named: "BlueFlower.jpg"))
        
        if let view = self.imageView
        {
            self.view.addSubview(view)
            
            view.contentMode = .ScaleAspectFit
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[i]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["i" : view]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[i]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["i" : view]))
        }
    }
    
    func loadVisualEffectView(blur: UIBlurEffect)
    {
        self.effectView?.removeFromSuperview()
        self.effectView = UIVisualEffectView(effect: blur)
        if let effect = self.effectView
        {
            self.view.insertSubview(effect, aboveSubview: self.imageView!)
            
            effect.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[i]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["i" : effect]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[i]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["i" : effect]))
        }
    }
    
    private func loadSegControl()
    {
        var items = UIBlurEffectStyle.rawValues
        items.insert("None", atIndex:0)
        
        controlButton = UISegmentedControl(items: items)
        
        if let control = self.controlButton
        {
            self.view.addSubview(control)
            
            control.selectedSegmentIndex = 0
            control.addTarget(self, action: "segmentedControlChanged:", forControlEvents: UIControlEvents.ValueChanged)
            control.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[i]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["i" : control]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[i(40)]-16-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["i" : control]))
        }
    }
    
    func segmentedControlChanged(sender:UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            self.effectView?.removeFromSuperview()
        }
        else
        {
            let blur = UIBlurEffect(style: UIBlurEffectStyle(rawValue: sender.selectedSegmentIndex - 1)!)
            loadVisualEffectView(blur)
        }
    }
    
}
