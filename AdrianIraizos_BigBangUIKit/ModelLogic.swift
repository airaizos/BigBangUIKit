//
//  ModelLogic.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class ModelLogic {
    static let shared = ModelLogic()
    
    let persistence = ModelPersistence.shared
    
    private var episodes: [Episode]
    private var seasons:[Int] {
        Array(Set(episodes.map { $0.season })).sorted()
    }
    
    
    private var favorites:[Int] {
        didSet {
            try? persistence.saveFavorites(ids: favorites)
            NotificationCenter.default.post(name: .favoritesChanged,object: nil)
        }
    }
    
    private var watched:[Int] {
        didSet {
            try? persistence.saveWatched(ids: watched)
            NotificationCenter.default.post(name: .watchedChanged,object: nil)
        }
    }
    
    private var checked:[Int] {
        didSet {
            try? persistence.saveChecked(ids: checked)
            NotificationCenter.default.post(name: .checkChanged,object: nil)
        }
    }
    
    private var ratings:Set<Rating> {
        didSet {
            try? persistence.saveRatings(ratings)
            NotificationCenter.default.post(name: .ratingChanged,object: nil)
        }
    }
    
    private init() {
        do {
            self.episodes = try persistence.loadEpisodes()
            self.favorites = try persistence.loadFavorites()
            self.watched = try persistence.loadWatched()
            self.ratings = try persistence.loadRatings()
            self.checked = try persistence.loadChecks()
        } catch {
           
            self.episodes = []
            self.favorites = []
            self.watched = []
            self.ratings = []
            self.checked = []
            
        }
    }
    
    var snapshot:NSDiffableDataSourceSnapshot<String,Episode> {
        var snapshot = NSDiffableDataSourceSnapshot<String,Episode>()
        let seasons = seasons.map { String(format: "%0d",$0) }
        snapshot.appendSections(seasons)
        for season in seasons {
            let episodes = episodes.filter { $0.seasonString == season }
            snapshot.appendItems(episodes, toSection: season)
        }
        return snapshot
    }
    
    //Temporadas??
    func getSnapshotForSeason(number:Int) -> NSDiffableDataSourceSnapshot<String,Episode> {
        var snapshot = NSDiffableDataSourceSnapshot<String,Episode>()
        let episodes = episodes.filter { $0.season == number }
        snapshot.appendItems(episodes, toSection: "\(number)")
        return snapshot
    }
    
    var snapshotSeasonOne:NSDiffableDataSourceSnapshot<String,Episode> {
        return getSnapshotForSeason(number: 1)
    }
    
    //MARK: Favoritos
    func getFavoritesCount() -> Int {
        favorites.count
    }
    
    func getEpisodeFromId(indexPath: IndexPath) -> Episode? {
        let id = favorites[indexPath.row]
        return episodes.first { $0.id == id }
    }
    
    func isFavorite(id:Int) -> Bool {
        favorites.contains(id)
    }
    
    func toggleFavorite(id:Int) {
        switch favorites.contains(id) {
        case true: favorites.removeAll { $0 == id }
        case false: favorites.append(id)
        }
    }
    
    //MARK: Watched
    func isWatched(id:Int) -> Bool {
        watched.contains(id)
    }
    
    func toggleWatch(id:Int) {
        switch watched.contains(id) {
        case true: watched.removeAll { $0 == id }
        case false: watched.append(id)
        }
    }
    
    func isCheck(id:Int) -> Bool {
        checked.contains(id)
    }
    func toggleChecked(id:Int) {
        switch checked.contains(id) {
        case true: checked.removeAll { $0 == id }
        case false: checked.append(id)
        }
    }
    
    func getRating(id:Int) -> Float {
        let ratings = ratings.filter { $0.id == id }
        guard let rating = ratings.first?.rating else { return 0.0 }
        return Float(rating)
    }
    
    func saveRating(id:Int,value:Float) {
        ratings.insert(Rating(id: id, rating: Int(value)))
    }
}
