//
//  iPadDetailView.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 7/4/23.
//

import SwiftUI

struct iPadDetailView: View {
    let episode: Episode
    
    var body: some View {
        Image(episode.image)
            .resizable()
            .scaledToFit()
    }
}

struct iPadDetailView_Previews: PreviewProvider {
    static var previews: some View {
        iPadDetailView(episode: .test)
    }
}
