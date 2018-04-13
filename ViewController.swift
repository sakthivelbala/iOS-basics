//
//  ViewController.swift
//  sampleapp
//
//  Created by Sakthivel Balakrishnan on 30/03/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    let lockImageView:UIImageView={
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Card_file"))
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    let descriptionData:UITextView={
        let textView=UITextView()
        textView.translatesAutoresizingMaskIntoConstraints=false
        let attributedString=NSMutableAttributedString(string:"something whatever i type will come u up for attribute one",attributes:[NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize:18)])
        attributedString.append(NSAttributedString(string:"\n\nwhatever in this will come up for attribute two and thats it you can add many more",attributes:[NSAttributedStringKey.font:UIFont.italicSystemFont(ofSize: 18),NSAttributedStringKey.foregroundColor:UIColor.gray]))
        textView.attributedText=attributedString
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
    let previousButton:UIButton={
       let button=UIButton(type : .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    let nextButton:UIButton={
        let button=UIButton(type : .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1), for: .normal)
        return button
    }()
    let pageController:UIPageControl={
       let pc=UIPageControl()
        pc.currentPage=0
        pc.numberOfPages=4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
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
        view.addSubview(descriptionData)
        descriptionData.topAnchor.constraint(equalTo: topHalf.bottomAnchor).isActive=true
        descriptionData.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive=true
        descriptionData.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive=true
        descriptionData.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        descriptionData.backgroundColor = .white
    }
    private func setupTopHalf(){
        view.addSubview(topHalf)
        topHalf.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        topHalf.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        topHalf.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        topHalf.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive=true
    }
    private func setupBottomControl(){
        let bottomStackView=UIStackView(arrangedSubviews: [previousButton,pageController,nextButton])
        bottomStackView.translatesAutoresizingMaskIntoConstraints=false
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            bottomStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setupTopHalf()
        setupImage()
        setupText()
        setupBottomControl()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

