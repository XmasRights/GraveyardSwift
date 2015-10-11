//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by Christopher Fonseka on 12/10/2015.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject
{
    class var sharedInstance: LibraryAPI
    {
        struct Singleton
        {
            static let instance = LibraryAPI()
        }
        
        return Singleton.instance
    }
    
}
