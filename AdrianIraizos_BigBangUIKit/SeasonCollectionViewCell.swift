//
//  SeasonCollectionViewCell.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit

final class SeasonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var markButton: UIButton!
    @IBOutlet weak var watchedButton: UIButton!
    @IBOutlet weak var ratingSlider: UISlider!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        episodeImage.image = nil
        nameLabel.text = nil
        favoriteButton.setImage(nil, for: .normal)
        markButton.setImage(nil, for: .normal)
        watchedButton.setImage(nil, for: .normal)
        ratingSlider = nil
    }
    
}
