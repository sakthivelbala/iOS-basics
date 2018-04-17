//
//  mainCell.swift
//  sampleapp
//
//  Created by Sakthivel Balakrishnan on 07/04/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit

class mainCell:UICollectionViewCell{
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    var wordLabel: UILabel={
        var label=UILabel()
        label.text="TEST TEST TEST"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    func setupView(){
        backgroundColor = .yellow
        addSubview(wordLabel)
        NSLayoutConstraint.activate([
            wordLabel.leftAnchor.constraint(equalTo: leftAnchor),
            wordLabel.topAnchor.constraint(equalTo: topAnchor)])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
