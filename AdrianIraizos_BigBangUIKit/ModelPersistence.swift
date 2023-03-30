//
//  ModelPersistence.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import Foundation

final class ModelPersistence {
    
    static let shared = ModelPersistence()
    
    let episodesURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    
    let favoritesDocument = URL.documentsDirectory.appending(path: "favorites.json")
    
    let watchedDocument = URL.documentsDirectory.appending(path: "watched.json")
    
    let checkedDocument = URL.documentsDirectory.appending(path: "checked.json")
    
    let ratingsDocument = URL.documentsDirectory.appending(path: "ratings.json")
    
    func loadEpisodes() throws -> [Episode] {
        let episodeDecoder = JSONDecoder()
        
        let data = try Data(contentsOf: episodesURL)
        return try episodeDecoder.decode([Episode].self, from: data)
    }
    
    func loadFavorites() throws -> [Int] {
        guard FileManager.default.fileExists(atPath: favoritesDocument.path()) else { return [] }
        let data = try Data(contentsOf: favoritesDocument)
        return try JSONDecoder().decode(Favorites.self, from: data).ids
    }
    
    func saveFavorites(ids:[Int]) throws {
        let favorites = Favorites(ids: ids)
        let data = try JSONEncoder().encode(favorites)
        try data.write(to: favoritesDocument, options: .atomic)
    }
    
    
    func loadWatched() throws -> [Int] {
        guard FileManager.default.fileExists(atPath: watchedDocument.path()) else { return [] }
        let data = try Data(contentsOf: watchedDocument)
        return try JSONDecoder().decode(Watched.self, from: data).ids
    }
    
    func saveWatched(ids:[Int]) throws {
        let watched = Watched(ids: ids)
        let data = try JSONEncoder().encode(watched)
        try data.write(to: watchedDocument, options: .atomic)
    }
    
    func loadRatings() throws -> [Rating] {
        guard FileManager.default.fileExists(atPath: ratingsDocument.path()) else {  return [] }
        let data = try Data(contentsOf: ratingsDocument)
        return try JSONDecoder().decode([Rating].self, from: data)
    }
    
    func saveRatings(_ ratings:[Rating]) throws {
        let data = try JSONEncoder().encode(ratings)
        try data.write(to: ratingsDocument, options: .atomic)
    }

    func loadChecks() throws -> [Int] {
        guard FileManager.default.fileExists(atPath: checkedDocument.path()) else {  return [] }
        let data = try Data(contentsOf: checkedDocument)
        return try JSONDecoder().decode(Checked.self, from: data).ids
    }
    func saveChecked(ids:[Int]) throws {
        let checked = Checked(ids: ids)
        let data = try JSONEncoder().encode(checked)
        try data.write(to: checkedDocument, options: .atomic)
        
    }
    
}
