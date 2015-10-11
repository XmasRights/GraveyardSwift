//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by Christopher Fonseka on 11/10/2015.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class Album: NSObject
{
    var title    : String!
    var artist   : String!
    var genre    : String!
    var coverURL : String!
    var year     : String!
    
    init(title: String, artist: String, genre: String, coverURL: String, year: String)
    {
        super.init()
        self.title    = title
        self.artist   = artist
        self.genre    = genre
        self.coverURL = coverURL
        self.year     = year
    }
    
    override var description: String
    {
        return "title: \(title)"       +
               "artist: \(artist)"     +
               "genre: \(genre)"       +
               "coverURL: \(coverURL)" +
	           "year: \(year)"
    }
}
