//
//  TableViewCell.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 29/3/23.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    override func prepareForReuse() {
        episodeImage.image = nil
        nameLabel.text = nil
        seasonNumberLabel.text = nil
        episodeNumberLabel = nil
      
        
      //  ratingSlider.setThumbImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    override func awakeFromNib() {
      

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }

}
