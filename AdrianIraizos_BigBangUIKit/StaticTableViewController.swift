//
//  StaticTableViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit

final class StaticTableViewController: UICollectionViewController {
    private let reuseIdentifier = "OneCell"
    let modelLogic = ModelLogic.shared
    
    /*
     lazy var dataSource:SeasonDiffableDataSource = {
     SeasonDiffableDataSource(collectionView: seasonOne) { [self] collectionView, indexPath, episode in
     
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SeasonCollectionViewCell
     cell?.episodeImage.image = UIImage(named: episode.image)
     cell?.nameLabel.text = episode.name
     cell?.favoriteButton.setImage(UIImage(systemName: "star.circle"), for: .normal)
     cell?.markButton.setImage(UIImage(systemName: "pin.circle"), for: .normal)
     cell?.watchedButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
     cell?.ratingSlider.setThumbImage(UIImage(systemName: "heart.circle"), for: .normal)
     return cell
     }
     }()
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.clearsSelectionOnViewWillAppear = false
        
        
        //  dataSource.apply(modelLogic.snapshotSeasonOne)
        
        
    }
    
    // MARK: - Table view data source
    
}
 
    /*
    final class SeasonOneCV: UICollectionView, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            <#code#>
        }
        
        var seasonOne:UICollectionView!
        private let reuseIdentifier = "oneCell"
        
       override lazy var dataSource:SeasonDiffableDataSource = {
            SeasonDiffableDataSource(collectionView: seasonOne) { [self] collectionView, indexPath, episode in
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SeasonCollectionViewCell
                cell?.episodeImage.image = UIImage(named: episode.image)
                cell?.nameLabel.text = episode.name
                cell?.favoriteButton.setImage(UIImage(systemName: "star.circle"), for: .normal)
                cell?.markButton.setImage(UIImage(systemName: "pin.circle"), for: .normal)
                cell?.watchedButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
                cell?.ratingSlider.setThumbImage(UIImage(systemName: "heart.circle"), for: .normal)
                return cell
            }
        }()
        
        override func awakeFromNib() {
            super.awakeFromNib()
            dataSource?.collectionView(seasonOne, numberOfItemsInSection: 30)
            dataSource.apply(modelLogic.snapshotSeasonOne)
        }
     
    }
    
}
*/
