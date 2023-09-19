//
//  EpisodesDiffableDataSource.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class EpisodesDiffableDataSource: UITableViewDiffableDataSource<String,Episode> {

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let snapshot = snapshot()
        return snapshot.sectionIdentifiers[section]
    }
}


final class EpisodeDiffableCollectionDataSource: UICollectionViewDiffableDataSource<String,Episode> {

}
