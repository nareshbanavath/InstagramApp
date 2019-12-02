//
//  StoriesCollectionViewCell.swift
//  InstagramApp
//
//  Created by IOS User1 on 28/11/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storyImage.layer.cornerRadius = storyImage.frame.width/2
        storyImage.layer.masksToBounds = true
        storyImage.layer.borderWidth = 3.0
        storyImage.layer.borderColor = UIColor.white.cgColor
        // Initialization code
    }

}
