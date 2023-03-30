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
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelLogic.getFavoritesCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FavoritesViewCell, let episode = modelLogic.getEpisodeFromId(indexPath: indexPath) else {  return UICollectionViewCell() }
        
        cell.episodeImage.image = UIImage(named: episode.image)
        cell.favoriteButton.setImage(viewLogic.getFavoriteImage(episodeId: episode.id), for: .normal)
        cell.watchedButton.setImage(viewLogic.getWatchedImage(episodeId: episode.id), for: .normal)
        cell.checkButton.setImage(viewLogic.getCheckedImage(episodeId: episode.id), for: .normal)
        cell.ratingSlider.setThumbImage(viewLogic.getRatingImage(), for: .normal)
        cell.ratingSlider.setValue(modelLogic.getRating(id: episode.id), animated: true)
        return cell
    }
    
}
