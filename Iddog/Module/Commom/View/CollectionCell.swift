//
//  CollectionCell.swift
//  Iddog
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){}
    
    func activeConstraint(constraints: [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints)
    }
}
