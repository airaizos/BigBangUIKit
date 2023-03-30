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
    
    
    func getFavoriteImage(episodeId:Int) -> UIImage {
        switch modelLogic.isFavorite(id: episodeId) {
        case true: return UIImage(systemName: "star.circle")!
        case false: return UIImage(systemName: "star.slash")!
        }
    }
    func getWatchedImage(episodeId:Int) -> UIImage {
        switch modelLogic.isWatched(id: episodeId) {
        case true: return UIImage(systemName: "eye.circle")!
        case false: return UIImage(systemName: "eye.slash.circle")!
        }
    }
    func getCheckedImage(episodeId:Int) -> UIImage {
        switch modelLogic.isCheck(id: episodeId) {
        case true: return UIImage(systemName: "checkmark.circle")!
        case false: return UIImage(systemName: "x.circle")!
        }
    }
    
    func getRatingImage() -> UIImage {
        UIImage(systemName: "heart.circle")!
    }
    
}
