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
        logo.centerInSuperView()
        view.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 175)
        return view
    }()
    
    //MARK: - TextFields
    private let emailTextField = UITextField.setupTextField(placeholder: "Email...", secureText: false)
    private let passwordTextField = UITextField.setupTextField(placeholder: "Password...", secureText: true)
    
    //MARK: - LoginButton
    private let loginButtoh = UIButton.setupButton(title: "Login", backColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        
    //MARK: - "кнопка у вас нет аккаунта?"
    private let dontHaveAccoutButton: UIButton =  {
        let but = UIButton.BicolorButton(textPart1: "Dont have an account?  ", textPart2: "Sigh In")
        but.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        return but
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureComponents()
        setupGesture()
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
        //презентер с полным отображением
        //navigationController?.pushViewController(vc, animated:true)
         let nvc = UINavigationController(rootViewController: vc)
         nvc.modalPresentationStyle = .fullScreen
         present(nvc,animated: true,completion: nil )
        
    }
    
      //MARK: - жест одиночный тап (hide keyboard)
      private func setupGesture() {
          view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
      }
      //MARK: - конец изменеий вью
      @objc fileprivate func handleTapDismiss() {
          view.endEditing(true)
      }

}
