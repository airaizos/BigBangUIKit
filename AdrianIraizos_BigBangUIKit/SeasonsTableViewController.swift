//
//  SeasonsTableViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class SeasonsTableViewController: UITableViewController,UISearchResultsUpdating {
    
    let modelLogic = ModelLogic.shared
    let modelPersistence = ModelPersistence.shared
    let viewLogic = ViewLogic.shared
    
    let nameCell = "tableCell"
    
    lazy var dataSource:EpisodesDiffableDataSource = {
        EpisodesDiffableDataSource(tableView: tableView){ [self] table, indexPath, episode in
            guard let cell = table.dequeueReusableCell(withIdentifier: nameCell, for: indexPath) as? TableViewCell else { return UITableViewCell() }
            
            cell.episodeImage.image = viewLogic.getImageFrom(episode: episode)
            cell.nameLabel.text = episode.name
            cell.episodeNumberLabel.text = episode.episodeString
            cell.airDateLabel.text = episode.airDateString
 
            return cell
        }
    }()
    
    
    @IBOutlet weak var WatchedButtonLabel: UIBarButtonItem!
    
    @IBOutlet weak var CheckedButtonLabel: UIBarButtonItem!
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! TableViewHeader
        
        let season = "\(section + 1)"
        view.seasonNumberLabel.text = season
        view.seasonImage.image = UIImage(named: "season\(season)")
        
        view.contentView.backgroundColor = .BBTPale
        
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
            handler(true)
        }
        favoriteAction.image = viewLogic.buttonWithSymbolConfiguration(systemName: "star.circle", color: .BBTYellow!)
        favoriteAction.backgroundColor = .BBTOcher
        
        let isWatched = modelLogic.isWatched(id: episode.id)
        let watchedAction = UIContextualAction(style: .normal, title: isWatched ? "Mark as Not Watched" : "Mark as Watched") { [self]  _,_, handler in
            modelLogic.toggleWatch(id: episode.id)
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
            
            handler(true)
        }
        
        checkedAction.image = viewLogic.buttonWithSymbolConfiguration(systemName: "checkmark.circle", color: .BBTYellow!)
        checkedAction.backgroundColor = .BBTBlack
        return UISwipeActionsConfiguration(actions: [checkedAction])
    }
    
    //MARK: BarButtons
    
    @IBAction func WatchedButtonPressed(_ sender: UIBarButtonItem) {
        viewLogic.watchedBarButtonPressed()
        WatchedButtonLabel.image = viewLogic.getWatchedBarButtonImage()
        dataSource.apply(modelLogic.snapshot, animatingDifferences: true)
    }
    
    
    @IBAction func CheckedButtonPressed(_ sender: UIBarButtonItem) {
        CheckedButtonLabel.image = UIImage(systemName: "x.circle")
    }
    
    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> DetailViewController? {
        let detail = DetailViewController(coder: coder)
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        detail?.selectedEpisode = dataSource.itemIdentifier(for: indexPath)
        
        return detail
    }
    
    
}
