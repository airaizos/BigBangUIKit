//
//  iPadDetailViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 7/4/23.
//

import SwiftUI


final class iPadDetailViewController: UIViewController {
    var selectedEpisode:Episode? {
        didSet {
          loadEpisode()
        }
    }
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    @IBOutlet weak var welcomeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(forName: .selectedEpisode, object: nil, queue: .main) { notification in
            guard let episode = notification.object as? Episode else { return }
            
            self.selectedEpisode = episode
          
        }
       
        
    }
    
    func loadEpisode() {
       guard let episode = selectedEpisode else { return }
        
        episodeImage.image = UIImage(named: episode.image)
        nameLabel.text = episode.name
        seasonNumberLabel.text = episode.seasonString
        episodeNumberLabel.text = episode.episodeString
        airDateLabel.text = episode.airDateString
        summaryTextView.text = episode.summary
        
        
        if selectedEpisode != nil {
            welcomeView.isHidden = true
        }
    }
    
    

    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .selectedEpisode, object: nil)
    }
}
