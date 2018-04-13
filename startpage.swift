//
//  startpage.swift
//  sampleapp
//
//  Created by Sakthivel Balakrishnan on 01/04/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit

class startpage:UIViewController{
    let maintext:UILabel={
        let textView = UILabel()
        textView.text="WELCOME THANK YOU FOR DOWNLOADING THE APP"
        textView.font=UIFont(name: "Futura", size: 20)
        textView.textAlignment = NSTextAlignment.left
        textView.numberOfLines=0
        return textView
    }()
    let descText:UILabel={
        let textView = UILabel()
        textView.text="This is the desription text that comes after the main text in the view"
        textView.textAlignment = NSTextAlignment.right
        textView.numberOfLines=0
        return textView
    }()
    private func setupView(){
        let stackView=UIStackView(arrangedSubviews: [maintext,descText])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints=false
        stackView.spacing=10
        stackView.axis = .vertical
        NSLayoutConstraint.activate([
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200)
        ])
        
    }
    @objc private func animation(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.maintext.transform=CGAffineTransform(translationX: -30, y: 0)
        },completion: { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.maintext.alpha=0
                self.maintext.transform=self.maintext.transform.translatedBy(x: 0, y: -(self.view.frame.height/4))
            })
        })
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.descText.transform=CGAffineTransform(translationX: 30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.descText.alpha=0
                self.descText.transform=self.maintext.transform.translatedBy(x: self.view.frame.width/3, y: -(self.view.frame.height/4))
                
            },completion:{
                (_) in
                self.changeScreen()
            })
        }
        
        
    }
     private func changeScreen(){
        let layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nextPage = introPage(collectionViewLayout: layout)
        present(nextPage,animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animation)))
    }
}
