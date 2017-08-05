//
//  PhotoCell .swift
//  RestAPIWithCoreData
//
//  Created by Amar Bhatia on 7/16/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    let photoImageview: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "picture")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let tagsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    
    func setupViews() {
        backgroundColor = .white
        
        addSubview(photoImageview)
        addSubview(authorLabel)
        addSubview(tagsLabel)
        addSubview(dividerLineView)
        
        
       _ = photoImageview.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 170)
        
        _ = authorLabel.anchor(photoImageview.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 40)

        _ = tagsLabel.anchor(authorLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 40)
        
        _ = dividerLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 1)


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    func setPhotoCellWith(photo: Photo) {
        DispatchQueue.main.async {
            self.authorLabel.text = photo.author
            self.tagsLabel.text = photo.tags
            if let url = photo.mediaURL {
                self.photoImageview.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
            }
        }
    }
    
    
    
    
}
