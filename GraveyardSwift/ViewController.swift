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
    var data = [ShapeLayerCodeSample(), BlurCodeSample(), CodeSampleViewController()]
    let transitionDelegate: TransitionDelegate = TransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Code Samples"
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell: CodeSampleCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CodeSampleCell
        data[indexPath.row].formatCell(&cell)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return data.count
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
        
        let detailViewController = data[indexPath.row]
        detailViewController.transitioningDelegate = transitionDelegate
        detailViewController.modalPresentationStyle = .Custom
        presentViewController(detailViewController, animated: true, completion: nil)
    }
}

