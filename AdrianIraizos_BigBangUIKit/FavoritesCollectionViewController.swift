//
//  FavoritesCollectionViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit

final class FavoritesCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "favoriteCell"
    
    let modelLogic = ModelLogic.shared
    let viewLogic = ViewLogic.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear =  false
        
        self.collectionView.setCollectionViewLayout(getLayout(), animated: false)
        
        NotificationCenter.default.addObserver(forName: .favoritesChanged, object: nil, queue: .main) { [self] _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }
        NotificationCenter.default.addObserver(forName: .watchedChanged, object: nil, queue: .main) { [self] _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }
        NotificationCenter.default.addObserver(forName: .checkChanged, object: nil, queue: .main) { [self] _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }
    }
    
    func getLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        let indexPathToHide = IndexPath()
        
        listConfig.itemSeparatorHandler = { (indexPath, sectionSeparatorConfiguration) in
            var configuration = sectionSeparatorConfiguration
            if indexPath == indexPathToHide {
                configuration.bottomSeparatorVisibility = .hidden
            }
            return configuration
        }
        let layout = UICollectionViewCompositionalLayout.list(using: listConfig)
        return layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelLogic.getFavoritesCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FavoritesViewCell, let episode = modelLogic.getEpisodeFromId(indexPath: indexPath) else {  return UICollectionViewCell() }
        
        cell.episodeImage.image = UIImage(named: episode.image)
        cell.episodeImage.layer.cornerRadius = 12
        cell.episodeNumberLabel.text = episode.episodeString
        cell.seasonNumberLabel.text = episode.seasonString
        
        
        cell.favoriteButton.setImage(viewLogic.getFavoriteImage(episodeId: episode.id,font: .largeTitle), for: .normal)
        cell.watchedButton.setImage(viewLogic.getWatchedImage(episodeId: episode.id,font: .largeTitle), for: .normal)
        cell.checkButton.setImage(viewLogic.getCheckedImage(episodeId: episode.id,font: .largeTitle), for: .normal)
        cell.nameLabel.text = episode.name
        
       
        cell.favoriteButton.addTarget(self, action: #selector(self.favoritePressed), for: .touchUpInside)
        cell.favoriteButton.tag = episode.id
        
        cell.watchedButton.addTarget(self, action: #selector(self.watchedPressed), for: .touchUpInside)
        cell.watchedButton.tag = episode.id
        
        cell.checkButton.addTarget(self, action: #selector(self.checkedPressed), for: .touchUpInside)
        cell.checkButton.tag = episode.id
        
        return cell
        
    }
    
    @objc func favoritePressed(_ sender: UIButton) {
        modelLogic.toggleFavorite(id: sender.tag)
        
    }
    @objc func watchedPressed(_ sender: UIButton) {
        modelLogic.toggleWatch(id: sender.tag)
    }
    @objc func checkedPressed(_ sender: UIButton) {
        modelLogic.toggleChecked(id: sender.tag)
    }
    
    
}
