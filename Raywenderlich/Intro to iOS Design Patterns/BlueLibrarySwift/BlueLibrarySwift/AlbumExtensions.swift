//
//  AlbumExtensions.swift
//  BlueLibrarySwift
//
//  Created by Christopher Fonseka on 16/10/2015.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import Foundation

extension Album
{
    func ae_tableRepresentation() -> (titles: [String], values: [String])
    {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}