//
//  SeasonsTableViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class SeasonsTableViewController: UITableViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        dataSource.apply(modelLogic.snapshot)
    }
    
    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> DetailViewController? {
        let detail = DetailViewController(coder: coder)
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        detail?.selectedEpisode = dataSource.itemIdentifier(for: indexPath)
        
        return detail
    }
    
    
}
