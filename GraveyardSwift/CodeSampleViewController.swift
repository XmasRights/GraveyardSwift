//
//  CodeSampleViewController.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class CodeSampleViewController: UIViewController, CodeSampleCellGenerator
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "viewTapped")
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func viewTapped() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func formatCell(inout cell: CodeSampleCell)
    {
        cell.titleLabel.text = "Empty"
    }
}
