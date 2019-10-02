//
//  ItemCell.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var boxImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        boxImageView.layer.cornerRadius = 5
        boxImageView.contentMode = .scaleAspectFill
        boxImageView.layer.masksToBounds = true
        
    }
    
    func setupImage(imageString: String){
        boxImageView.sd_setImage(with: URL(string: imageString), completed: nil)
    }

}
