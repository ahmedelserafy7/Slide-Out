//
//  SlideOutViewController.swift
//  explainIdea
//
//  Created by Elser_10 on 10/1/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

class SlideOutView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let slideOutViewer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "steve"))
        iv.layer.cornerRadius = 25
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let infoTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Steve Jobs"
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
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
        
        window.addSubview(slideOutViewer)

        slideOutViewer.frame = CGRect(x: -250, y: 0, width: 250, height: window.frame.height)
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.slideOutViewer.frame = CGRect(x: 0, y: 0, width: self.slideOutViewer.frame.width, height: self.slideOutViewer.frame.height)
            
            self.setupViews()
            
        }, completion: nil)
    }
    
    func setupViews() {

        self.slideOutViewer.addSubview(profileImageView)
        self.slideOutViewer.addSubview(infoTextView)
        slideOutViewer.addSubview(self.collectionView)
        
        profileImageView.topAnchor.constraint(equalTo: self.slideOutViewer.topAnchor, constant: 36).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.slideOutViewer.leftAnchor, constant: 14).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        infoTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true
        infoTextView.leftAnchor.constraint(equalTo: profileImageView.leftAnchor).isActive = true
        infoTextView.rightAnchor.constraint(equalTo: slideOutViewer.rightAnchor, constant: -14).isActive = true
        infoTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let attributedText = NSMutableAttributedString(string: "Steve Jobs", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])
        attributedText.append(NSMutableAttributedString(string: "\n@steveJobs", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        attributedText.append(NSMutableAttributedString(string: "\n\n123 ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]))
        
        attributedText.append(NSMutableAttributedString(string: "Following", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]))
        
        attributedText.append(NSMutableAttributedString(string: "  1.4m ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]))
        
        attributedText.append(NSAttributedString(string: "Followers", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]))
        
        infoTextView.attributedText = attributedText
        
        self.collectionView.topAnchor.constraint(equalTo: infoTextView.bottomAnchor, constant: 8).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: slideOutViewer.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: slideOutViewer.rightAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: slideOutViewer.bottomAnchor).isActive = true
        
    }
    
     @objc func dismissSlideOut() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            guard let window = UIApplication.shared.keyWindow else { return }
            self.slideOutViewer.frame = CGRect(x: -250, y: 0, width: 250, height: window.frame.height)
            self.homeViewController?.dismissView()
            
            self.blackView.alpha = 0
        }) { (completed) in
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    var settingLabelsArray: [String] = ["Profile", "Lists", "Bookmarks", "Moments"]
    var settingImagesArray: [String] = ["profile", "list", "bookmarks", "moments"]
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlideOutCell
        cell.settingsLabel.text = settingLabelsArray[indexPath.item]
        cell.settingsImageView.image = UIImage(named: settingImagesArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        dismissSlideOut()
        let text = settingLabelsArray[indexPath.item]
        self.homeViewController?.showViewControllerBySettings(text)
    }
    
    private let cellId = "cellId"
    override init() {
        super.init()
        
        self.slideOutViewer.layer.shadowOpacity = 0.6
        self.slideOutViewer.layer.shadowRadius = 5
        self.slideOutViewer.layer.masksToBounds = false
        
        collectionView.register(SlideOutCell.self, forCellWithReuseIdentifier: cellId)
    }

}
