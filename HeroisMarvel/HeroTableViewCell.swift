//
//  HeroTableViewCell.swift
//  HeroisMarvel
//
//  Created by Vitoria Ortega on 04/07/24.
//  Copyright © 2024 Eric Brito. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(with hero: Hero) {
        lbName.text = hero.name
        lbDescription.text = hero.description
        if let url = URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.ext)") {
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        } else {
            ivThumb.image = nil
        }
        
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height / 2
        ivThumb.layer.borderColor = UIColor.red.cgColor
        ivThumb.layer.borderWidth = 2
        
    }
}
