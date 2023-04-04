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
    
    func getFavoriteImage(episodeId:Int, font: UIFont.TextStyle = .title3) -> UIImage {
        switch modelLogic.isFavorite(id: episodeId) {
        case true: return buttonWithSymbolConfiguration(systemName: "star.circle", color: .BBTYellow!,font: font)
            
        case false: return buttonWithSymbolConfiguration(systemName: "star.slash", color: .BBTPale!)
          
        }
    }
    func getWatchedImage(episodeId:Int,font: UIFont.TextStyle = .title3) -> UIImage {
        switch modelLogic.isWatched(id: episodeId) {
        case true: return buttonWithSymbolConfiguration(systemName: "eye.circle", color: .BBTGreen!, font: font)
            
        case false: return buttonWithSymbolConfiguration(systemName: "eye.slash.circle", color: .BBTPale!)
        }
    }
    func getCheckedImage(episodeId:Int, font: UIFont.TextStyle = .title3) -> UIImage {
        switch modelLogic.isCheck(id: episodeId) {
        case true: return buttonWithSymbolConfiguration(systemName: "checkmark.circle", color: .BBTGreenish!, font: font)

        case false: return buttonWithSymbolConfiguration(systemName: "x.circle", color: .BBTPale!)
        }
    }
    
    func getRatingImage(episodeId:Int, buttonRating: Int) -> UIImage {
        let active = buttonWithSymbolConfiguration(systemName: "heart.circle", color: .BBTRed!)
        let inactive = buttonWithSymbolConfiguration(systemName: "heart.circle", color: .BBTPale!)
        let rating = modelLogic.getRating(id: episodeId)
        
        switch buttonRating {
        case 1: return rating >= 1 ? active : inactive
        case 2: return rating >= 2 ? active : inactive
        case 3: return rating >= 3 ? active : inactive
        case 4: return rating >= 4 ? active : inactive
        case 5: return rating >= 5 ? active : inactive
            
        default: ()
        }
        return inactive
    }
    
    func getImageFrom(episode:Episode) -> UIImage {
        return UIImage(named: episode.image) ?? UIImage(systemName: "ellipsis.rectangle")!
    }
    
    func buttonWithSymbolConfiguration(systemName: String, color: UIColor, font: UIFont.TextStyle = .title3) -> UIImage {
         
        UIImage(systemName: systemName, withConfiguration: UIImage.SymbolConfiguration(font: .preferredFont(forTextStyle: .title2)).applying(UIImage.SymbolConfiguration(weight: .light)).applying(UIImage.SymbolConfiguration(paletteColors: [color, color.withAlphaComponent(0.4)])))!
     }
     
    
    // SearchBar
    func getSearchBar() -> UISearchController {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search by episode, summary..."
        search.obscuresBackgroundDuringPresentation = false
        return search
    }
    
    
}
