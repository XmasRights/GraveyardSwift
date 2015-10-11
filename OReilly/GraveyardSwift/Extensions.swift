//
//  Extensions.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

extension UIColor
{
    class func randomColour() -> UIColor
    {
        func random() -> CGFloat
        {
            return CGFloat(arc4random()) / CGFloat(UINT32_MAX)
        }
        return UIColor(red: random(), green: random(), blue: random(), alpha: 1.0)
    }
    
    class func darkTurquoiseColour() -> UIColor
    {
        return UIColor(red: 0, green: 153/255.0, blue: 76/255.0, alpha: 1.0)
    }
}