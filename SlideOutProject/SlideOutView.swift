//
//  SlideOutViewController.swift
//  explainIdea
//
//  Created by Elser_10 on 10/1/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

class SlideOutViewer: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let blackView = UIView()
    var homeViewController: ViewController?
    func showSlideOut() {
        
        blackView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
        blackView.alpha = 0
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissSlideOut)))
        
        guard let window = UIApplication.shared.keyWindow else { return }
        window.addSubview(blackView)
        
        blackView.frame = window.frame
        
        blackView.addSubview(collectionView)

        collectionView.frame = CGRect(x: -250, y: 0, width: 250, height: window.frame.height)
        
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.collectionView.frame = CGRect(x: 0, y: 0, width: 250, height: window.frame.height)
            
        }, completion: nil)
    }
    
    func dismissSlideOut() {
        print(111)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            guard let window = UIApplication.shared.keyWindow else { return }
            
            
            self.collectionView.frame = CGRect(x: -250, y: 0, width: 250, height: window.frame.height)
            self.homeViewController?.dismissView()
            
            self.blackView.alpha = 0
        }) { (completed) in
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlideOutCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    private let cellId = "cellId"
    override init() {
        super.init()
        
        self.collectionView.layer.shadowOpacity = 0.8
        self.collectionView.layer.shadowRadius = 6
        self.collectionView.layer.masksToBounds = false
        
        collectionView.register(SlideOutCell.self, forCellWithReuseIdentifier: cellId)
    }

}
