//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by Christopher Fonseka on 11/10/2015.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class AlbumView: UIView
{
    private var coverImage: UIImageView!
    private var indicator:  UIActivityIndicatorView!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit();
    }
    
    init(frame: CGRect, albumCover: String)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit()
    {
        let borderSize  = CGFloat(10)
        
        backgroundColor = UIColor.blackColor()
        coverImage      = UIImageView(frame: CGRectMake(borderSize / 2, borderSize / 2,
                                                        frame.size.width - borderSize, frame.size.height - borderSize))
        addSubview(coverImage)
        
        
        indicator = UIActivityIndicatorView()
        indicator.center = center
        indicator.activityIndicatorViewStyle = .WhiteLarge
        indicator.startAnimating()
        addSubview(indicator)
    }
    
    
    // ===================================================
    
    func highlightAlbum (didHightlightView didHightlightView: Bool)
    {
        backgroundColor = (didHightlightView ? UIColor.whiteColor() : UIColor.blackColor())
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
