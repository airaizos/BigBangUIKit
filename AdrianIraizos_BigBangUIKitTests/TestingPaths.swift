//
//  TestingPaths.swift
//  AdrianIraizos_BigBangUIKitTests
//
//  Created by Adrian Iraizos Mendoza on 19/9/23.
//

import Foundation

@testable import AdrianIraizos_BigBangUIKit
struct TestingPaths: URLDestination {
    
    let episodesURL = Bundle(for: AdrianIraizos_BigBangUIKitTests.self).url(forResource: "TestBigBang", withExtension: "json")!
    
   let favoritesDocument = URL.temporaryDirectory.appending(path: "favorites.json")
    
   let watchedDocument = URL.temporaryDirectory.appending(path: "watched.json")
    
   let checkedDocument = URL.temporaryDirectory.appending(path: "checked.json")
    
   let ratingsDocument = URL.temporaryDirectory.appending(path: "ratings.json")
    
}
