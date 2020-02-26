//
//  SlideOutCell.swift
//  SlideOutProject
//
//  Created by Elser_10 on 10/18/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

class SlideOutCell: UICollectionViewCell {
    
    let settingsImageView: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(settingsImageView)
        addSubview(settingsLabel)
        
        settingsImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingsImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        settingsImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        settingsImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        settingsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingsLabel.leftAnchor.constraint(equalTo: settingsImageView.rightAnchor, constant: 8).isActive = true
        settingsLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        settingsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
