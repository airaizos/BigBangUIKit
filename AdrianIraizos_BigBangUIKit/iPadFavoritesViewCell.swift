//
//  iPadFavoritesViewCell.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 8/4/23.
//

import SwiftUI

struct iPadFavoritesViewCell: View {
    var episode:Episode
    var isFavorite:Bool
    var isWatched:Bool
    var isChecked:Bool
    
    var body: some View {
        VStack(spacing:20) {
            VStack(spacing: 10)  {
                
                
                VStack{
                    Text(episode.name)
                        .foregroundColor(Color(.BBTGreen!))
                        .font(.title3)
                        .fontWeight(.heavy)
                    
                    Image(episode.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 214, height: 120)
                        .cornerRadius(20)
                        .shadow(color: Color(.BBTRedish!).opacity(0.3), radius: 2, x: 5, y: 5)
                }
                HStack(spacing:50) {
                    Image(systemName: "star.circle")
                        .foregroundColor(isFavorite ? Color(.BBTYellow!) : Color(.BBTPale!))
                    Image(systemName: "eye.circle")
                        .foregroundColor(isWatched ? Color(.BBTGreenish!) : Color(.BBTPale!))
                    Image(systemName: "checkmark.circle")
                    
                        .foregroundColor(isChecked ? Color(.BBTBlue!) : Color(.BBTPale!))
                }
                .font(.body)
            }
            HStack{
                HStack {
                    Text("Season")
                    Text(episode.seasonString)
                        .foregroundColor(Color(.BBTGreen!))
                        .fontWeight(.bold)
                }
                HStack {
                    Text("Episode")
                    Text(episode.episodeString)
                        .foregroundColor(Color(.BBTRed!))
                        .fontWeight(.bold)
                }
            }
            .font(.subheadline)
            Spacer()
        }
       
    }
}

struct iPadFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        iPadFavoritesViewCell(episode: .test, isFavorite: true, isWatched: false, isChecked: false)
    }
}
