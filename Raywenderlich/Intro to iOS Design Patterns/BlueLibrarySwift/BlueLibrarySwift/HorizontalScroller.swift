//
//  HorizontalScroller.swift
//  BlueLibrarySwift
//
//  Created by Christopher Fonseka on 16/10/2015.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

@objc protocol HorizontalScrollerDelegate
{
    func numberOfViewsForHorizontalScroller(scroller: HorizontalScroller) -> Int
    func horizontalScrollerViewAtIndex(scroller: HorizontalScroller, index: Int) -> UIView
    func horizontalScrollerClickedViewAtIndex(scroller: HorizontalScroller, index: Int)
    
    optional func initialViewIndex(scroller: HorizontalScroller) -> Int
}

class HorizontalScroller: UIView
{
    weak var delegate: HorizontalScrollerDelegate?
    
    private let VIEW_PADDING    = 10
    private let VIEW_DIMENSIONS = 100
    private let VIEWS_OFFSET    = 100
    
    private var scroller: UIScrollView!
    
    var viewArray = [UIView]()
    
    // ===================================================
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        initialiseScrollView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        initialiseScrollView()
    }
    
    func initialiseScrollView()
    {
        scroller = UIScrollView()
        scroller.delegate = self
        addSubview(scroller)
        
        scroller.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Leading,  relatedBy: .Equal,
                                            toItem: self,     attribute: .Leading,  multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Trailing, relatedBy: .Equal,
                                            toItem: self,     attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Top,      relatedBy: .Equal,
                                            toItem: self,     attribute: .Top,      multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Bottom,   relatedBy: .Equal,
                                            toItem: self,     attribute: .Bottom,   multiplier: 1.0, constant: 0.0))
        
        let tapRecognoiser = UITapGestureRecognizer(target: self, action: Selector("scrollerTapped"))
        scroller.addGestureRecognizer(tapRecognoiser)
    }
    
    
    // ===================================================
    
    override func didMoveToSuperview()
    {
        reload()
    }
    
    
    // ===================================================

    func scrollerTapped(gesture: UITapGestureRecognizer)
    {
        let location = gesture.locationInView(gesture.view)
        if let delegate = delegate
        {
            for index in 0..<delegate.numberOfViewsForHorizontalScroller(self)
            {
                let view = scroller.subviews[index]
                if CGRectContainsPoint(view.frame, location)
                {
                    delegate.horizontalScrollerClickedViewAtIndex(self, index: index)
                    scroller.setContentOffset(CGPoint(x: view.frame.origin.x - self.frame.size.width/2 + view.frame.size.width/2, y: 0), animated:true)
                    break
                }
            }
        }
    }
    
    
    // ===================================================

    func viewAtIndex(index: Int) -> UIView
    {
        return viewArray[index]
    }
    
    func centerCurrentView()
    {
        var xFinal = Int(scroller.contentOffset.x) + (VIEWS_OFFSET/2) + VIEW_PADDING
        let viewIndex = xFinal / (VIEW_DIMENSIONS + (2*VIEW_PADDING))
        xFinal = viewIndex * (VIEW_DIMENSIONS + (2*VIEW_PADDING))
        scroller.setContentOffset(CGPoint(x: xFinal, y: 0), animated: true)
        
        if let delegate = delegate
        {
            delegate.horizontalScrollerClickedViewAtIndex(self, index: Int(viewIndex))
        }  
    }
    
    func reload()
    {
        if let delegate = delegate
        {
            viewArray = []
            let views = scroller.subviews
            
            for view in views
            {
                view.removeFromSuperview()
            }
            
            var xValue = VIEWS_OFFSET
            for index in 0..<delegate.numberOfViewsForHorizontalScroller(self)
            {
                xValue += VIEW_PADDING
                let view = delegate.horizontalScrollerViewAtIndex(self, index: index)
                view.frame = CGRectMake(CGFloat(xValue), CGFloat(VIEW_PADDING), CGFloat(VIEW_DIMENSIONS), CGFloat(VIEW_DIMENSIONS))
                scroller.addSubview(view)
                xValue += VIEW_DIMENSIONS + VIEW_PADDING

                viewArray.append(view)
            }
            
            scroller.contentSize = CGSizeMake(CGFloat(xValue + VIEWS_OFFSET), frame.size.height)
            
            
            if let initialView = delegate.initialViewIndex?(self)
            {
                scroller.setContentOffset(CGPoint(x: CGFloat(initialView)*CGFloat((VIEW_DIMENSIONS + (2 * VIEW_PADDING))), y: 0), animated: true)
            }
        }
    }
}

extension HorizontalScroller: UIScrollViewDelegate
{
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        if !decelerate
        {
            centerCurrentView()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        centerCurrentView()
    }
}

