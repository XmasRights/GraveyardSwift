//
//  ViewController.swift
//  GraveyardSwift
//
//  Created by Christopher Fonseka on 25/03/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{

    var colorsArray = [UIColor.redColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.blueColor()]
    let transitionDelegate: TransitionDelegate = TransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS 7 Colors"
        collectionView?.backgroundColor = .clearColor()
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
    {
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 4.0
        cell.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell: CodeSampleCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CodeSampleCell
        cell.backgroundColor = colorsArray[indexPath.row]
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return colorsArray.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(200, 240)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        let cell: CodeSampleCell = collectionView.cellForItemAtIndexPath(indexPath) as CodeSampleCell
        
        let attributes = collectionView.layoutAttributesForItemAtIndexPath(indexPath)
        let attributesFrame = attributes?.frame
        let frameToOpenFrom = collectionView.convertRect(attributesFrame!, toView: collectionView.superview)
        transitionDelegate.openingFrame = frameToOpenFrom
        
        let detailViewController = CodeSampleViewController()
        detailViewController.view.backgroundColor = colorsArray[indexPath.row]
        detailViewController.transitioningDelegate = transitionDelegate
        detailViewController.modalPresentationStyle = .Custom
        presentViewController(detailViewController, animated: true, completion: nil)
    }
}

