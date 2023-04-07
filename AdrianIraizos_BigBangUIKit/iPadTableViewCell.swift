//
//  iPadTableViewCell.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 7/4/23.
//

import SwiftUI

struct iPadTableViewCell: View {
    let episode: Episode
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(episode.name)
                    .foregroundColor(Color(.BBTGreen!))
                    .shadow(color: Color(.BBTGreenish!), radius: 1, x: 2, y: 2)
                    .font(.headline)
                    .fontWeight(.bold)
                HStack {
                    Image(episode.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .cornerRadius(12)
                        .shadow(color: Color(.BBTGray!), radius: 12, x: 5, y: 5)
                    VStack(alignment: .trailing) {
                    Text("Season \(episode.seasonString)")
                        .foregroundColor(Color(.BBTRed!))
                        .font(.body)
                        .shadow(color: Color(.BBTOcher!), radius: 2, x: 1, y: 1)
                
                    Text("Episode \(episode.episodeString)")
                        .foregroundColor(Color(.BBTBlue!))
                        .font(.body)
                        .shadow(color: Color(.BBTYellow!), radius: 2, x: 1, y: 1)
                }
            }
                
                Text(episode.airDateString)
                    .foregroundColor(Color(.BBTGray!))
                    .font(.caption2)
                    .fontWidth(.expanded)
                    
            }
           
            
        }
    }
}

struct iPadTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        iPadTableViewCell(episode: .test)
    }
}
