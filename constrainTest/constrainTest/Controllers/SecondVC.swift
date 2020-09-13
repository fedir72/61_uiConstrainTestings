//
//  SecondVC.swift
//  constrainTest
//
//  Created by fedir on 04.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK: - properties
    
    private let logocontainerwiev: UIView = {
        let view = UIView()
        let logo = UIImageView(image:#imageLiteral(resourceName: "images").withRenderingMode(.alwaysOriginal))
        logo.contentMode = .scaleAspectFill
        view.addSubview(logo)
        logo.anchor(top: nil, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: 200, height: 60) )
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 175)
        return view
    }()
    
        private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "  Email..."
        tf.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 18)
        return tf
        }()
    
    private let passwordTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "  Password..."
    tf.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    tf.borderStyle = .roundedRect
    tf.font = UIFont.systemFont(ofSize: 18)
    return tf
    }()
    
    private let loginButtoh: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(.red, for: .normal)
        bt.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        bt.layer.cornerRadius = 7
        return bt
    }()
    //MARK: - "кнопка у вас нет аккаунта?"
    private let dontHaveAccoutButton: UIButton =  {
        let but = UIButton(type: .system)
        //первая часть кнопки
        let arributeTitle = NSMutableAttributedString(string: "Dont have an account?  ", attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor:  UIColor.lightGray ] )
        //вторая часть кнопки
        arributeTitle.append(NSAttributedString(string: "Sigh In", attributes: [.font: UIFont.systemFont(ofSize: 18) , .foregroundColor: UIColor.systemBlue]))
        but.setAttributedTitle(arributeTitle, for: .normal)
        //MARK: - переход на следующий контроллер
        but.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        return but
    }()
    
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureComponents()
    }
    
    private func configureComponents() {
        
        view.backgroundColor = .white
        navigationItem.title = "Second VC"
        view.addSubview(logocontainerwiev)
        logocontainerwiev.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing:view.trailingAnchor , padding: .init(top: 87, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 150))
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButtoh])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: logocontainerwiev.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 180))
        
        view.addSubview(dontHaveAccoutButton)
        dontHaveAccoutButton.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom:view.safeAreaLayoutGuide.bottomAnchor , trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 40, bottom: 30 , right: 40))
    }
    //MARK: - func переход
    
    @objc private func goToSignUp() {
        let vc = SignUpController()
        navigationController?.pushViewController(vc, animated:true)
        
    }
   

}
