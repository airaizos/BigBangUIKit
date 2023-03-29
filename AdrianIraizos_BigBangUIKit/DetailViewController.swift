//
//  DetailViewController.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var selectedEpisode:Episode?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let episode = selectedEpisode else { return }
        nameLabel.text = episode.name
        seasonNumberLabel.text = episode.seasonString
        episodeImage.image = UIImage(named: episode.image)
        summaryTextView.text = episode.summary
        
    }
    
}


