//
//  CodeSampleViewController.swift
//  GraveyardSwift
//
//  Created by Christopher Fonseka on 25/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

extension UIColor
{
	private class func random() -> CGFloat
	{
		return CGFloat(arc4random()) / CGFloat(UINT32_MAX)
	}
	
	class func randomColour() -> UIColor
	{
		return UIColor(red: random(), green: random(), blue: random(), alpha: 1.0)
	}
}

class CodeSampleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
	private let reuseIdentifier = "CodeSampleCell"
	let data = ["One", "Two", "Three", "Four"]
	
	// ===================================================
	// MARK: UICollectionViewDataSource
	// ===================================================
	override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
	{
		return 1
	}
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
	{
		return data.count
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
	{
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
		cell.backgroundColor = UIColor.randomColour()
		return cell
	}
	
	
	// ===================================================
	// MARK: UICollectionViewDelegateFlowLayout
	// ===================================================
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(50.0, 20.0, 50.0, 20.0)
	}
	
}
