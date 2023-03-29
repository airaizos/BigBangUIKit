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

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }
 */

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
