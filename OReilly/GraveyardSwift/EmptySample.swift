//
//  EmptySample.swift
//  GraveyardSwift
//
//  Created by Christopher Fonseka on 25/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import Foundation

class EmptySample: CodeSampleCellGenerator
{
	func formatCell(inout cell: CodeSampleCell)
	{
		cell.textLabel.text = "Empty"
	}
}