//
//  TableViewHeader.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 4/4/23.
//

import UIKit

final class TableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var seasonImage: UIImageView!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        seasonNumberLabel.text = nil
        seasonImage.image =  nil
    }
    
}
