//
//  FavoritesViewCell.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit

final class FavoritesViewCell: UICollectionViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var watchedButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var ratingSlider: UISlider!
    
    override class func awakeFromNib() {
        
    }
    
    override func prepareForReuse() {
        episodeImage.image = nil
        favoriteButton.setImage(nil, for: .normal)
        watchedButton.setImage(nil, for: .normal)
        ratingSlider.setThumbImage(nil, for: .normal)
    }
}
