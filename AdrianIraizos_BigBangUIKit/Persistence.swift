//
//  ModelPersistence.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import Foundation


protocol URLDestination {
    var episodesURL: URL { get }
    var favoritesDocument: URL { get }
    var watchedDocument: URL { get }
    var checkedDocument: URL { get }
    var ratingsDocument: URL { get }
}

final class Persistence {
    private static let instance = Persistence()
    
    //Testing Singleton
#if DEBUG
    static var stubbedInstance: Persistence?
#endif
    
    static var shared: Persistence {
#if DEBUG
        if let stubbedInstance = stubbedInstance {
            print("<< StubbedInstance Initiated")
           return stubbedInstance
        }
#endif
        return instance
        
    }
    private var decoder: JSONDecoder
    private var encoder: JSONEncoder
    private var fileManager: FileManager
    private var paths: URLDestination
    
    init(decoder: JSONDecoder = JSONDecoder(), encoder: JSONEncoder = JSONEncoder(), fileManager: FileManager = FileManager.default, paths: URLDestination = LocalPaths()) {
        self.decoder = decoder
        self.encoder = encoder
        self.fileManager = fileManager
        self.paths  = paths
    }
    
    func loadEpisodes() throws -> [Episode] {
        let data = try Data(contentsOf: paths.episodesURL)
        return try decoder.decode([Episode].self, from: data)
    }
    
    func loadFavorites() throws -> [Int] {
        guard fileManager.fileExists(atPath: paths.favoritesDocument.path()) else { return [] }
        let data = try Data(contentsOf: paths.favoritesDocument)
        return try decoder.decode(Favorites.self, from: data).ids
    }

    func saveFavorites(ids:[Int]) throws {
        let favorites = Favorites(ids: ids)
        let data = try encoder.encode(favorites)
        try data.write(to: paths.favoritesDocument, options: .atomic)
    }
    
    func loadWatched() throws -> [Int] {
        guard fileManager.fileExists(atPath: paths.watchedDocument.path()) else { return [] }
        let data = try Data(contentsOf: paths.watchedDocument)
        return try decoder.decode(Watched.self, from: data).ids
    }
    
    func saveWatched(ids:[Int]) throws {
        let watched = Watched(ids: ids)
        let data = try encoder.encode(watched)
        try data.write(to: paths.watchedDocument, options: .atomic)
    }
    
    func loadRatings() throws -> [Int:Int] {
        guard fileManager.fileExists(atPath: paths.ratingsDocument.path()) else {  return [:] }
        let data = try Data(contentsOf: paths.ratingsDocument)
        return try decoder.decode([Int:Int].self, from: data)
    }
    
    func saveRatings(_ ratings: [Int:Int]) throws {
        let data = try encoder.encode(ratings)
        try data.write(to: paths.ratingsDocument, options: .atomic)
    }
    
    func loadChecks() throws -> [Int] {
        guard fileManager.fileExists(atPath: paths.checkedDocument.path()) else {  return [] }
        let data = try Data(contentsOf: paths.checkedDocument)
        return try decoder.decode(Checked.self, from: data).ids
    }
    
    func saveChecked(ids:[Int]) throws {
        let checked = Checked(ids: ids)
        let data = try encoder.encode(checked)
        try data.write(to: paths.checkedDocument, options: .atomic)
        
    }
}
