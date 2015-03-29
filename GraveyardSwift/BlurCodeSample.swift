//
//  BlurCodeSample.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class BlurCodeSample : CodeSampleViewController
{
    private var imageView: UIImageView?
    
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
    
}
