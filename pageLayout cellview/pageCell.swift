//
//  pageCell.swift
//  sampleapp
//
//  Created by Sakthivel Balakrishnan on 03/04/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit

class pageCell: UICollectionViewCell {
    
    var page:Page?{
        didSet{
            guard let unWrappedData = page else{ return}
            lockImageView.image=UIImage(named: unWrappedData.imageVeiwName)
                let attributedString=NSMutableAttributedString(string:unWrappedData.headerText,attributes:[NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize:18)])
                attributedString.append(NSAttributedString(string:"\n\n\(unWrappedData.descText)",attributes:[NSAttributedStringKey.font:UIFont.italicSystemFont(ofSize: 18),NSAttributedStringKey.foregroundColor:UIColor.gray]))
            descriptionData.attributedText=attributedString
            descriptionData.textAlignment = .center
        }
    }
    private let lockImageView:UIImageView={
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    let descriptionData:UITextView={
        let textView=UITextView()
        textView.translatesAutoresizingMaskIntoConstraints=false
        textView.isEditable=false
        textView.isSelectable=false
        textView.isScrollEnabled=false
        textView.textAlignment = .center
        return textView
    }()
    let topHalf:UIView={
        let topSubView=UIView()
        topSubView.translatesAutoresizingMaskIntoConstraints=false
        return topSubView
    }()
    private func setupImage(){
        topHalf.addSubview(lockImageView)
        lockImageView.centerXAnchor.constraint(equalTo: topHalf.centerXAnchor).isActive=true
        lockImageView.centerYAnchor.constraint(equalTo: topHalf.centerYAnchor).isActive=true
        lockImageView.widthAnchor.constraint(equalToConstant: 120).isActive=true
        lockImageView.heightAnchor.constraint(equalToConstant:120).isActive=true
        lockImageView.contentMode = .scaleAspectFill
    }
    private func setupText(){
        addSubview(descriptionData)
        descriptionData.topAnchor.constraint(equalTo: topHalf.bottomAnchor).isActive=true
        descriptionData.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive=true
        descriptionData.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive=true
        descriptionData.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    private func setupTopHalf(){
        addSubview(topHalf)
        topHalf.topAnchor.constraint(equalTo: topAnchor).isActive=true
        topHalf.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        topHalf.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        topHalf.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive=true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTopHalf()
        setupImage()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
