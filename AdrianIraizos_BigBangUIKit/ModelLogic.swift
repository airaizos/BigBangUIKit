//
//  ModelLogic.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import Foundation

final class ModelLogic {
    static let shared = ModelLogic()
    
    let persistence = ModelPersistence.shared
    
    private var episodes: [Episode]
    
    private init() {
        do {
            self.episodes = try persistence.loadEpisodes()
            
        } catch {
            self.episodes = []
        }
    }
    
}
