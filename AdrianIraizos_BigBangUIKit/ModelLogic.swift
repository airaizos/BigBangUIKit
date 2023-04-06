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
    
    private var ratings:[Int:Int] {
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
            self.ratings = [:]
            self.checked = []
            
        }
    }
    
    var snapshot:NSDiffableDataSourceSnapshot<String,Episode> {
        var snapshot = NSDiffableDataSourceSnapshot<String,Episode>()
        let seasons = seasons.map { String(format: "%0d",$0) }
        snapshot.appendSections(seasons)
        for season in seasons {
            let episodes = filteredEpisodes.filter { $0.seasonString == season }
            snapshot.appendItems(episodes, toSection: season)
        }
        return snapshot
    }
    
    var favoritesSnapshot: NSDiffableDataSourceSnapshot<String,Episode> {
        var snapshot = NSDiffableDataSourceSnapshot<String,Episode>()
        snapshot.appendSections([""])
        /*
         let episodes = episodes.filter { episode in
         favorites.contains(episode.id)
         }
         */
        let favoritesIds = favoritesFilteredEpisodes.filter { id in
            favorites.contains(id)
        }
        let episodes = episodes.filter {  episode in
            favoritesIds.contains(episode.id)
        }
        
        snapshot.appendItems(episodes)
        return snapshot
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
    
    func getRating(id:Int) -> Int {
        let ratings = ratings.filter { $0.key == id }
        guard let rating = ratings[id] else { return 0 }
        return rating
    }
    
    func saveRating(id:Int,value:Int) {
        ratings[id] = value
    }
    
    func ratingPressed(episodeId: Int,rating:Int) {
        ratings[episodeId] = rating
    }
    
    //MARK: SearchBarTableView
    
    var searchText = ""
    var filteredEpisodes:[Episode] {
        
        return listFilterEpisodes.filter {
            switch searchText.isEmpty {
            case true: return true
            case false: return
                $0.name.lowercased().trimmingCharacters(in: .whitespaces).contains(searchText.lowercased()) ||
                $0.summary.lowercased().trimmingCharacters(in: .whitespaces).contains(searchText.lowercased()) ||
                $0.episodeString.contains(searchText) ||
                $0.seasonString.contains(searchText) ||
                $0.airDateString.contains(searchText)
                
            }
        }
    }
    
    //MARK: SearchBarFavorites
    var favoritesFilteredEpisodes:[Int] {
        favorites.filter { id in
            switch searchText.isEmpty {
            case true: return true
            case false:
                guard let favoriteEpisode = episodes.first (where: { $0.id == id }) else { return false }
                return favoriteEpisode.name.lowercased().trimmingCharacters(in: .whitespaces).contains(searchText.lowercased())
            }
        }
    }
    
    //MARK: BarButtons Items
    //All Watched, NotWatched
    var watchedBarButtonState: BarButtonAction = .all
    var checkedBarButtonState: BarButtonAction = .all
    
    enum BarButtonAction {
        case all, marked, unmarked
    }
    
    var listFilterEpisodes:[Episode] {
        
        episodes.filter { [self] episode in
            switch (checkedBarButtonState,watchedBarButtonState) {
            case (.all,.all): return true
            case (.all,.marked): return watched.contains { episode.id == $0 }
            case (.all, .unmarked): return watched.allSatisfy { $0 != episode.id }
            case (.marked, .marked): return checked.contains { episode.id == $0 } && watched.contains { episode.id == $0 }
            case (.marked, .unmarked): return checked.contains { episode.id == $0 } && watched.allSatisfy { $0 != episode.id }
            case (.marked,.all): return checked.contains { episode.id == $0 }
            case (.unmarked, .marked): return checked.allSatisfy { $0 != episode.id } && watched.contains { episode.id == $0 }
            case (.unmarked, .unmarked): return checked.allSatisfy { $0 != episode.id } && watched.allSatisfy { episode.id != $0 }
            case (.unmarked, .all): return checked.allSatisfy { $0 != episode.id }
                
            }
            
        }
    }
    
    
    
    
}
