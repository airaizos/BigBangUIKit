//
//  Interface.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 19/9/23.
//

import Foundation

struct LocalPaths: URLDestination {
    
   let episodesURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    
   let favoritesDocument = URL.documentsDirectory.appending(path: "favorites.json")
    
   let watchedDocument = URL.documentsDirectory.appending(path: "watched.json")
    
   let checkedDocument = URL.documentsDirectory.appending(path: "checked.json")
    
   let ratingsDocument = URL.documentsDirectory.appending(path: "ratings.json")
    
}
