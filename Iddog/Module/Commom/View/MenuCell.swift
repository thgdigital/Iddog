//
//  MenuCell.swift
//  Iddog
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class MenuCell: CollectionCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
       return label
    }()
    
    
    func populate(name: String) {
        titleLabel.text = name
    }
    
    override func setupViews() {
        addSubview(titleLabel)
        activeConstraint(constraints: [
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
}
