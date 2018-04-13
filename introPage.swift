//
//  introPage.swift
//  sampleapp
//
//  Created by Sakthivel Balakrishnan on 03/04/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit

class introPage: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages=[
        Page(imageVeiwName: "Card_file", headerText: "Its great to see you here and welcome to the application", descText: "The security features are great in this app and nothing more to type"),
    Page(imageVeiwName: "Time", headerText: "Its great that we value your time ", descText: "I typed this because i dont know what to type"),
        Page(imageVeiwName: "Card_file", headerText: "Its great to see you here and welcome to the application", descText: "The security features are great in this app and nothing more to type"),
        Page(imageVeiwName: "Time", headerText: "Its great that we value your time ", descText: "I typed this because i dont know what to type"),
        Page(imageVeiwName: "Card_file", headerText: "Its great to see you here and welcome to the application", descText: "The security features are great in this app and nothing more to type"),
        Page(imageVeiwName: "Time", headerText: "Its great that we value your time ", descText: "I typed this because i dont know what to type"),
        Page(imageVeiwName: "Card_file", headerText: "Its great to see you here and welcome to the application", descText: "The security features are great in this app and nothing more to type"),
        Page(imageVeiwName: "Time", headerText: "Its great that we value your time ", descText: "I typed this because i dont know what to type")
    ]
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
           self.collectionViewLayout.invalidateLayout()
            if self.pageController.currentPage==0{
                self.collectionView?.contentOffset = .zero
            }else{
                self.collectionView?.scrollToItem(at: IndexPath(item: self.pageController.currentPage, section: 0), at: .centeredHorizontally, animated: true)}
        }) { (_) in
            
        }
    }
    let previousButton:UIButton={
        let button=UIButton(type : .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    @objc func handlePrev(){
        let nextIndex=max(pageController.currentPage-1,0)
        pageController.currentPage=nextIndex
        collectionView?.scrollToItem(at:IndexPath(item: nextIndex, section: 0),at: .centeredHorizontally,animated:true)
    }
    let nextButton:UIButton={
        let button=UIButton(type : .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc func handleNext(){
        if pageController.currentPage==(pages.count-1){
            mainPrpgramNavigation()
        }
        let nextIndex=min(pageController.currentPage+1,pages.count-1)
        pageController.currentPage=nextIndex
        collectionView?.scrollToItem(at:IndexPath(item: nextIndex, section: 0),at: .centeredHorizontally,animated:true)
    }
    func mainPrpgramNavigation(){
        let tabBarController=UITabBarController()
        let mainscreen=UINavigationController(rootViewController:
            mainScreen(collectionViewLayout: UICollectionViewFlowLayout()))
        mainscreen.title="WALL"
        let sample=coreMl()
        sample.title="prototype"
    tabBarController.viewControllers=[mainscreen,sample,ViewController()]
        present(tabBarController,animated: true)
    }
    lazy var pageController:UIPageControl={
        let pc=UIPageControl()
        pc.currentPage=0
        pc.numberOfPages=pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
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
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pageController.currentPage=Int(targetContentOffset.pointee.x/view.frame.width)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.backgroundColor = .white
        collectionView!.register(pageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled=true
        setupBottomControl()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)as! pageCell
       let pagess=pages[indexPath.item]
        cell.page=pagess
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
