//
//  Episode.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import Foundation

struct Episode:Hashable, Codable {
    let id:Int
    let url:URL
    let name:String
    let season:Int
    let number:Int
    let airdate:String
    let runtime:Int
    let image:String
    let summary:String
    
    var seasonString:String {
        //String(format: "%02d",season)
        "\(season)"
    }
    var episodeString:String{
        String(format: "%02d",number)
    }
    

    
}
