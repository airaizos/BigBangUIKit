//
//  CollectionSeasonOneCollectionViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit

private let reuseIdentifier = "OneCell"


final class CollectionSeasonOneCollectionViewController: UICollectionViewController {
    
    let modelLogic = ModelLogic.shared
    
    lazy var dataSource:SeasonDiffableDataSource = {
        SeasonDiffableDataSource(collectionView: collectionView) { [self] collectionView, indexPath, episode in
            
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.dataSource = dataSource
        dataSource.apply(modelLogic.snapshotSeasonOne)
    }
    
}


final class SeasonDiffableDataSource: UICollectionViewDiffableDataSource<String,Episode> {
    let modelLogic = ModelLogic.shared
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelLogic.snapshotSeasonOne.numberOfItems
    }
}
