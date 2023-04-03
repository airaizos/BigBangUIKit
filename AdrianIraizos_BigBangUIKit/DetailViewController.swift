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
   
    //Rating
    
    @IBOutlet weak var rating1: UIButton!
    @IBOutlet weak var rating2: UIButton!
    @IBOutlet weak var rating3: UIButton!
    @IBOutlet weak var rating4: UIButton!
    @IBOutlet weak var rating5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let episode = selectedEpisode else { return }
        nameLabel.text = episode.name
        seasonNumberLabel.text = episode.seasonString
        episodeImage.image = UIImage(named: episode.image)
        summaryTextView.text = episode.summary
        favoriteButton.setImage(viewLogic.getFavoriteImage(episodeId: episode.id), for: .normal)
        watchedButton.setImage(viewLogic.getWatchedImage(episodeId: episode.id), for: .normal)
        checkButton.setImage(viewLogic.getCheckedImage(episodeId: episode.id), for: .normal)
        rating1.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 1), for: .normal)
        rating2.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 2), for: .normal)
        rating3.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 3), for: .normal)
        rating4.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 4), for: .normal)
        rating5.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 5), for: .normal)
        
        
        NotificationCenter.default.addObserver(forName: .favoritesChanged, object: nil, queue: .main) { [self] _ in
            favoriteButton.setImage(viewLogic.getFavoriteImage(episodeId: episode.id), for: .normal)
        }
        NotificationCenter.default.addObserver(forName: .watchedChanged, object: nil, queue: .main) { [self] _ in
            watchedButton.setImage(viewLogic.getWatchedImage(episodeId: episode.id), for: .normal)
        }
        NotificationCenter.default.addObserver(forName: .checkChanged, object: nil, queue: .main) { [self] _ in
            checkButton.setImage(viewLogic.getCheckedImage(episodeId: episode.id), for: .normal)
        }
        NotificationCenter.default.addObserver(forName: .ratingChanged, object: nil, queue: .main) { [self] _ in
            rating1.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 1), for: .normal)
            rating2.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 2), for: .normal)
            rating3.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 3), for: .normal)
            rating4.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 4), for: .normal)
            rating5.setImage(viewLogic.getRatingImage(episodeId: episode.id, buttonRating: 5), for: .normal)
        }
        
    }
    
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.toggleFavorite(id: episode.id)
     //   favoriteButton.setTitleColor(UIColor(named: "BBT375"), for: .normal)
        
    }

    @IBAction func watchedPressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.toggleWatch(id: episode.id)
        
    }
    
    @IBAction func checkPressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.toggleChecked(id: episode.id)
        checkButton.setTitleColor(UIColor(named: "BBTBlue"), for: .normal)
    }
    
    //Ratings
    
    @IBAction func rating1Pressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.ratingPressed(episodeId: episode.id, rating: 1)
        print(episode.id,modelLogic.getRating(id: episode.id))
        
    }
    
    @IBAction func rating2Pressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.ratingPressed(episodeId: episode.id, rating: 2)
        print(episode.id,modelLogic.getRating(id: episode.id))
    }
    
    
    @IBAction func rating3Pressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.ratingPressed(episodeId: episode.id, rating: 3)
        print(episode.id,modelLogic.getRating(id: episode.id))
    }
    
    
    @IBAction func rating4Pressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.ratingPressed(episodeId: episode.id, rating: 4)
        print(episode.id,modelLogic.getRating(id: episode.id))
    
    }
    
    @IBAction func rating5Pressed(_ sender: UIButton) {
        guard let episode = selectedEpisode else { return }
        modelLogic.ratingPressed(episodeId: episode.id, rating: 5)
        print(episode.id,modelLogic.getRating(id: episode.id))
    }
    
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favoritesChanged, object: nil)
        NotificationCenter.default.removeObserver(self, name: .watchedChanged, object: nil)
        NotificationCenter.default.removeObserver(self, name: .checkChanged, object: nil)
        NotificationCenter.default.removeObserver(self, name: .ratingChanged, object: nil)
    }
}


