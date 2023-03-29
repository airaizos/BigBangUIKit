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
    
    private init() {
        do {
            self.episodes = try persistence.loadEpisodes()
            
        } catch {
            print("error loadingEpisodes")
            self.episodes = []
        }
    }
    
    var snapshot:NSDiffableDataSourceSnapshot<String,Episode> {
        var snapshot = NSDiffableDataSourceSnapshot<String,Episode>()
        let seasons = Array(Set(episodes.map { $0.seasonString })).sorted()
        snapshot.appendSections(seasons)
        for season in seasons {
            let episodes = episodes.filter { $0.seasonString == season }
            snapshot.appendItems(episodes, toSection: season)
        }
        return snapshot
    }
    
    
}
