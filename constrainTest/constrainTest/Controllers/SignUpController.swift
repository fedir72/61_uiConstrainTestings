//
//  SignUpController.swift
//  constrainTest
//
//  Created by fedir on 09.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    //MARK: - Properties
    
    fileprivate let plusPhotoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        //btn.layer.cornerRadius = btn.frame.width/2
        btn.backgroundColor = .white
        return btn
    }()
    //MARK: - TextFields
    private let emailTextField = UITextField.setupTextField(placeholder: " Email...", secureText: false)
    private let fullNameTextField = UITextField.setupTextField(placeholder: " Full name...", secureText: false)
    private let nickNameTextField = UITextField.setupTextField(placeholder: " Your nick...", secureText: false)
    private let passWordTextField = UITextField.setupTextField(placeholder: " Password...", secureText: true)
    //MARK: - SetUpButton
     private let signUpButtoh = UIButton.setupButton(title: "Sign Up", backColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        
    //MARK: - "кнопка у вас уже есть аккаунт?" 
      private let allreadyHaveAccoutButton: UIButton =  {
          let but = UIButton.BicolorButton(textPart1: "Already have an account?  ", textPart2: "Sigh In")
          but.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
          return but
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureComponents()
    }
    
     //MARK: - settings for components
    private func configureComponents() {
     view.backgroundColor = .white
        view.addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor , leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 40, bottom: 0, right: 40))
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,fullNameTextField,
                                                 nickNameTextField,passWordTextField,
                                                 signUpButtoh])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 16, left: 40, bottom: 0, right: 40),size: .init(width: 0, height: 280))
        
        view.addSubview(allreadyHaveAccoutButton)
        allreadyHaveAccoutButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 30, right: 16))
        
    }
    
    //MARK: -  func goToPreviousVC
    @objc private func goToSignIn() {
       // navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
