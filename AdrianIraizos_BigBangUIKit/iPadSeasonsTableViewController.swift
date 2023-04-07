//
//  iPadSeasonsTableViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 7/4/23.
//

import SwiftUI

final class iPadSeasonsTableViewController: UITableViewController,UISearchResultsUpdating {
    
    let modelLogic = ModelLogic.shared
    let modelPersistence = ModelPersistence.shared
    let viewLogic = ViewLogic.shared
    
    let nameCell = "iPadCell"
    
    lazy var dataSource:EpisodesDiffableDataSource = {
        EpisodesDiffableDataSource(tableView: tableView){ [self] table, indexPath, episode in
            let cell = table.dequeueReusableCell(withIdentifier: nameCell, for: indexPath)
            cell.contentConfiguration = UIHostingConfiguration {
                iPadTableViewCell(episode: episode)
            }
 
            return cell
        }
    }()
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! TableViewHeader
        
        let season = "\(section + 1)"
        view.seasonNumberLabel.text = season
        view.seasonImage.image = UIImage(named: "season\(season)")
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = viewLogic.getSearchBar()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        tableView.dataSource = dataSource
        dataSource.apply(modelLogic.snapshot)
        
        //Header
        let sectionHeader = UINib(nibName: "TableViewHeader", bundle: nil)
        tableView.register(sectionHeader, forHeaderFooterViewReuseIdentifier: "sectionHeader")

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text  else { return }
        modelLogic.searchText = search
        dataSource.apply(modelLogic.snapshot, animatingDifferences: true)
    }
    
    // MARK: Swipe Actions
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = dataSource.itemIdentifier(for: indexPath) else { return nil }
        
        let isFavorite = modelLogic.isFavorite(id: episode.id)
        let favoriteAction = UIContextualAction(style: .normal, title: isFavorite ? "Mark as Not Favorite" : "Mark as Favorite") { [self] _,_, handler in
            
            modelLogic.toggleFavorite(id: episode.id)
            dataSource.apply(modelLogic.snapshot, animatingDifferences: true)
            handler(true)
        }
        favoriteAction.image = viewLogic.buttonWithSymbolConfiguration(systemName: "star.circle", color: .BBTYellow!)
        favoriteAction.backgroundColor = .BBTOcher
        
        let isWatched = modelLogic.isWatched(id: episode.id)
        let watchedAction = UIContextualAction(style: .normal, title: isWatched ? "Mark as Not Watched" : "Mark as Watched") { [self]  _,_, handler in
            modelLogic.toggleWatch(id: episode.id)
            dataSource.apply(modelLogic.snapshot, animatingDifferences: true)
            handler(true)
        }
        watchedAction.image = viewLogic.buttonWithSymbolConfiguration(systemName: "eye.circle", color: .BBTWhite!)
        watchedAction.backgroundColor = .BBTGreen
        
        return UISwipeActionsConfiguration(actions: [favoriteAction,watchedAction])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = dataSource.itemIdentifier(for: indexPath) else { return nil }
        
        let isChecked = modelLogic.isCheck(id: episode.id)
        let checkedAction = UIContextualAction(style: .normal, title: isChecked ? "Mark as Not Checked" : "Mark as Checked") { [self] _,_, handler in
            modelLogic.toggleChecked(id: episode.id)
            dataSource.apply(modelLogic.snapshot, animatingDifferences: true)
            handler(true)
        }
        
        checkedAction.image = viewLogic.buttonWithSymbolConfiguration(systemName: "checkmark.circle", color: .BBTYellow!)
        checkedAction.backgroundColor = .BBTBlack
        return UISwipeActionsConfiguration(actions: [checkedAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = dataSource.itemIdentifier(for: indexPath)
        NotificationCenter.default.post(name: .selectedEpisode, object: selected)
        
    }
}
