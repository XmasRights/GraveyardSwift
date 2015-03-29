//
//  CodeSampleCell.swift
//  GraveyardSwift
//
//  Created by ChrisHome on 29/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class CodeSampleCell : UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}

protocol CodeSampleCellGenerator
{
    func formatCell(inout cell: CodeSampleCell)
}
