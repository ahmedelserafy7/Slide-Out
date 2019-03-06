//
//  ViewController.swift
//  SlideOutProject
//
//  Created by Elser_10 on 10/1/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    lazy var profileImageView: UIImageView = {
        let image = UIImage(named: "steve")
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 25
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSlideOut)))
        return iv
    }()
    
    
    lazy var slideOutView: SlideOutView = {
        let sv = SlideOutView()
        sv.homeViewController = self
        return sv
    }()
    
    func handleSlideOut() {
//        print(1233)
    
        slideOutView.showSlideOut()
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.collectionView?.frame = CGRect(x: 250, y: 0, width: self.collectionView!.frame.width, height: self.collectionView!.frame.height)
        }, completion: nil)
        
        
    }
    
    func dismissView() {
        
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: self.collectionView!.frame.width, height: self.collectionView!.frame.height)
    }
    
    func showViewControllerBySettings(_ text: String) {
        let settingsController = InfoViewController()
        settingsController.signLabel.text = text
        navigationController?.pushViewController(settingsController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        collectionView?.backgroundColor = .white
        
        let steveImage = UIButton(type: .system)
        steveImage.setImage(#imageLiteral(resourceName: "steve").withRenderingMode(.alwaysOriginal), for: .normal)
        steveImage.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        steveImage.layer.cornerRadius = 12
        steveImage.clipsToBounds = true
        steveImage.addTarget(self, action: #selector(handleSlideOut), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: steveImage)
        
        setupProfileImageView()
    }
    
    
    func setupProfileImageView() {
        
        collectionView?.addSubview(profileImageView)
        
        profileImageView.topAnchor.constraint(equalTo: collectionView!.topAnchor, constant: 30).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: collectionView!.leftAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}

