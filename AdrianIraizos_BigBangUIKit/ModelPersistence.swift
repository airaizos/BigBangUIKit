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
        
    func loadEpisodes() throws -> [Episode] {
        let episodeDecoder = JSONDecoder()
        
        let data = try Data(contentsOf: episodesURL)
        return try episodeDecoder.decode([Episode].self, from: data)
    }

}
