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
        btn.layer.cornerRadius = btn.frame.width/2
        btn.backgroundColor = .white
        return btn
    }()
    
    private let emailTextField: UITextField = {
       let tF = UITextField()
        tF.placeholder = " Email..."
        tF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tF.borderStyle = .roundedRect
        tF.font = UIFont.systemFont(ofSize: 23)
        return tF
    }()
    
     private let fullNameTextField: UITextField = {
          let tF = UITextField()
           tF.placeholder = " Full name..."
           tF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
           tF.borderStyle = .roundedRect
           tF.font = UIFont.systemFont(ofSize: 23)
           return tF
       }()
    
     private let nickNameTextField: UITextField = {
          let tF = UITextField()
           tF.placeholder = " Email..."
           tF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
           tF.borderStyle = .roundedRect
           tF.font = UIFont.systemFont(ofSize: 23)
           return tF
       }()
    
     private let passWordTextField: UITextField = {
          let tF = UITextField()
           tF.placeholder = " Password..."
           tF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
           tF.borderStyle = .roundedRect
           tF.font = UIFont.systemFont(ofSize: 23)
           return tF
       }()
    
     private let signUpButtoh: UIButton = {
           let bt = UIButton(type: .system)
           bt.setTitle(" SignUp...", for: .normal)
           bt.setTitleColor(.red, for: .normal)
           bt.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
           bt.titleLabel?.font = UIFont.systemFont(ofSize: 30)
           bt.layer.cornerRadius = 7
           return bt
       }()
    
      //MARK: - "кнопка у вас уже есть аккаунт?"
    
      private let allreadyHaveAccoutButton: UIButton =  {
          let but = UIButton(type: .system)
          //первая часть кнопки
          let arributeTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor:  UIColor.lightGray ] )
          //вторая часть кнопки
          arributeTitle.append(NSAttributedString(string: "Sigh In", attributes: [.font: UIFont.systemFont(ofSize: 18) , .foregroundColor: UIColor.systemBlue]))
          but.setAttributedTitle(arributeTitle, for: .normal)
          //MARK: - переход на следующий контроллер
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
                                                nickNameTextField,passWordTextField,signUpButtoh])
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
        navigationController?.popViewController(animated: true)
    }

}
