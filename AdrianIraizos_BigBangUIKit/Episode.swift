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
        "\(season)"
    }
    var episodeString:String{
        String(format: "%02d",number)
    }
    var airDateString:String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        guard let dateD = df.date(from: airdate) else { return "" }
        df.dateFormat = "dd MMM yyyy"

        return df.string(from: dateD).capitalized
    }
    
}


struct Favorites:Codable {
    let ids:[Int]
}

struct Watched:Codable {
    let ids:[Int]
}

struct Checked:Codable {
    let ids:[Int]
}

struct Rating:Codable,Hashable {
    let id:Int
    let rating:Int
}
