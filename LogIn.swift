//
//  LogIn.swift
//  connectX
//
//  Created by Sakthivel Balakrishnan on 13/04/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit

class LogIn: UIViewController {
    let username:UITextField={
        let textField=UITextField()
        textField.translatesAutoresizingMaskIntoConstraints=false
        textField.layer.borderWidth=0.5
        textField.heightAnchor.constraint(equalToConstant: 30).isActive=true
        textField.textAlignment = .center
        textField.layer.borderColor=UIColor.lightGray.cgColor
        return textField
    }()
    let password:UITextField={
        let textField=UITextField()
        textField.translatesAutoresizingMaskIntoConstraints=false
        textField.isSecureTextEntry=true
        textField.layer.borderWidth=0.5
        textField.heightAnchor.constraint(equalToConstant: 30).isActive=true
        textField.textAlignment = .center
        textField.layer.borderColor=UIColor.lightGray.cgColor
        return textField
    }()
    let loginButton:UIButton={
        let button=UIButton()
        button.setTitle("Log in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor=UIColor.lightGray
        return button
    }()
    func setUpView(){
        let stackView=UIStackView(arrangedSubviews: [username,password,loginButton])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints=false
        stackView.axis = .vertical
        stackView.backgroundColor=UIColor.green
        stackView.spacing=20
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
            ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = .white
    }
}
