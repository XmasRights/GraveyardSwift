//
//  CodeSampleCell.swift
//  GraveyardSwift
//
//  Created by Christopher Fonseka on 25/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class CodeSampleCell: UICollectionViewCell
{
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var textLabel: UILabel!
}

protocol CodeSampleCellGenerator
{
	func formatCell(inout cell: CodeSampleCell)
}