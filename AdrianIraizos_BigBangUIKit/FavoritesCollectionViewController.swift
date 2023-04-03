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
        
        cell.favoriteButton.tag = episode.id
        cell.favoriteButton.addTarget(self, action: #selector(self.favoritePressed), for: .touchUpInside)
        
        return cell
        
       
    }
    
    @objc func favoritePressed(_ sender: UIButton) {
        print("favorite TAG",sender.tag,sender)
    }
    
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
    
    
                
            
            
        
        }
        
      
    
    
    
    
    @IBAction func watchedButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func checkedButtonPressed(_ sender: UIButton) {
    }
    
}
