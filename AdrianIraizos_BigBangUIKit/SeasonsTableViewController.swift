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
    
    let nameCell = "tableCell"
    
    lazy var dataSource:EpisodesDiffableDataSource = {
        EpisodesDiffableDataSource(tableView: tableView){ [self] table, indexPath, episode in
            let cell = table.dequeueReusableCell(withIdentifier: nameCell, for: indexPath) as? TableViewCell
            
            cell?.episodeImage.image = UIImage(named: episode.image)
            cell?.nameLabel.text = episode.name
            cell?.seasonNumberLabel.text = episode.seasonString
            
            //favoriteButton
            //markButton
            //watchedbutton
            //ratingSlider
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
