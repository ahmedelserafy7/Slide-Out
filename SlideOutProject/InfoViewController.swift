//
//  InfoViewController.swift
//  SlideOutProject
//
//  Created by Elser_10 on 10/18/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    let signLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 47)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(signLabel)
        signLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        signLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        signLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        signLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
