//
//  DetailViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
    let modelLogic = ModelLogic.shared
    let viewLogic = ViewLogic.shared
    
    var selectedEpisode:Episode?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var watchedButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let episode = selectedEpisode else { return }
        nameLabel.text = episode.name
        seasonNumberLabel.text = episode.seasonString
        episodeImage.image = UIImage(named: episode.image)
        summaryTextView.text = episode.summary
    
        
        
        NotificationCenter.default.addObserver(forName: .favoritesChanged, object: nil, queue: .main) { [self] _ in
            favoriteButton.setImage(viewLogic.getFavoriteImage(episodeId: episode.id), for: .normal)
        }
        NotificationCenter.default.addObserver(forName: .watchedChanged, object: nil, queue: .main) { [self] _ in
            watchedButton.setImage(viewLogic.getWatchedImage(episodeId: episode.id), for: .normal)
        }
        NotificationCenter.default.addObserver(forName: .checkChanged, object: nil, queue: .main) { [self] _ in
            checkButton.setImage(viewLogic.getCheckedImage(episodeId: episode.id), for: .normal)
        }
        
    }
    
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.toggleFavorite(id: episode.id)
    }

    @IBAction func watchedPressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.toggleWatch(id: episode.id)
    }
    
    @IBAction func checkPressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.toggleChecked(id: episode.id)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favoritesChanged, object: nil)
        NotificationCenter.default.removeObserver(self, name: .watchedChanged, object: nil)
        NotificationCenter.default.removeObserver(self, name: .checkChanged, object: nil)
    }
}


