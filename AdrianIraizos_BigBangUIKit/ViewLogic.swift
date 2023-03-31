//
//  ViewLogic.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit


final class ViewLogic {
    static let shared = ViewLogic()
    
    private init() { }
    
    let modelLogic = ModelLogic.shared
    var symbolConfiguration =  UIImage.SymbolConfiguration(font: .preferredFont(forTextStyle: .title3))
    func getFavoriteImage(episodeId:Int) -> UIImage {
        switch modelLogic.isFavorite(id: episodeId) {
        case true: return UIImage(systemName: "star.circle", withConfiguration: symbolConfiguration)!
        case false: return UIImage(systemName: "star.slash", withConfiguration: symbolConfiguration)!
        }
    }
    func getWatchedImage(episodeId:Int) -> UIImage {
        switch modelLogic.isWatched(id: episodeId) {
        case true: return UIImage(systemName: "eye.circle", withConfiguration: symbolConfiguration)!
        case false: return UIImage(systemName: "eye.slash.circle", withConfiguration: symbolConfiguration)!
        }
    }
    func getCheckedImage(episodeId:Int) -> UIImage {
        switch modelLogic.isCheck(id: episodeId) {
        case true: return UIImage(systemName: "checkmark.circle", withConfiguration: symbolConfiguration)!
        case false: return UIImage(systemName: "x.circle", withConfiguration: symbolConfiguration)!
        }
    }
    
    func getRatingImage() -> UIImage {
        //MARK: TODO quiza el slider no es la mejor opción

        return UIImage(systemName: "heart.circle", withConfiguration: symbolConfiguration)!
    }
    
    func getImageFrom(episode:Episode) -> UIImage {
        return UIImage(named: episode.image) ?? UIImage(systemName: "ellipsis.rectangle")!
    }
    
    
}
