//
//  iPadFavoritesCollectionViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 8/4/23.
//

import SwiftUI


final class iPadFavoritesCollectionViewController: UICollectionViewController,UISearchResultsUpdating {
    private let reuseIdentifier = "iPadFavoriteCell"
    
    let modelLogic = ModelLogic.shared
    let viewLogic = ViewLogic.shared
    
    
    lazy var dataSource: EpisodeDiffableCollectionDataSource = {
        EpisodeDiffableCollectionDataSource(collectionView: collectionView) { [self] collectionView, indexPath, episode in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            
            cell.contentConfiguration = UIHostingConfiguration {
                iPadFavoritesViewCell(episode: episode, isFavorite: modelLogic.isFavorite(id: episode.id), isWatched: modelLogic.isWatched(id: episode.id), isChecked: modelLogic.isCheck(id: episode.id))
            }
            
            return cell
        }
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear =  false
        
        self.collectionView.setCollectionViewLayout(getLayout(), animated: false)
        
        // Search
        let searchController = viewLogic.getSearchBar()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
       
        
        collectionView.dataSource = dataSource
        dataSource.apply(modelLogic.favoritesSnapshot)
        
        NotificationCenter.default.addObserver(forName: .favoritesChanged, object: nil, queue: .main) { [self] _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
            
            dataSource.apply(modelLogic.favoritesSnapshot)
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
   
    @objc func favoritePressed(_ sender: UIButton) {
        modelLogic.toggleFavorite(id: sender.tag)
        dataSource.apply(modelLogic.favoritesSnapshot)
        
    }
    @objc func watchedPressed(_ sender: UIButton) {
        modelLogic.toggleWatch(id: sender.tag)
        dataSource.apply(modelLogic.favoritesSnapshot)
    }
    @objc func checkedPressed(_ sender: UIButton) {
        modelLogic.toggleChecked(id: sender.tag)
        dataSource.apply(modelLogic.favoritesSnapshot)
    }
    
    //SearchBar
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text else { return }
        modelLogic.searchText = search
        dataSource.apply(modelLogic.favoritesSnapshot, animatingDifferences: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = dataSource.itemIdentifier(for: indexPath)
        NotificationCenter.default.post(name: .selectedEpisode, object: selected)
    }
    
}


