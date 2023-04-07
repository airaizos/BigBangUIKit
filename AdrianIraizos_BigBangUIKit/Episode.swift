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

extension Episode {
    static let test = Episode(id: 1646220, url: URL(string: "https://www.tvmaze.com/episodes/1646220/the-big-bang-theory-12x24-the-stockholm-syndrome")!, name: "The Stockholm Syndrome", season: 12, number: 24, airdate: "2019-05-16", runtime: 30, image: "493243", summary: "Bernadette and Wolowitz leave their kids for the first time; Penny and Leonard try to keep a secret; Sheldon and Amy stick together; and Koothrappali makes a new friend, as the gang travels together into an uncharted future.\n")
}
