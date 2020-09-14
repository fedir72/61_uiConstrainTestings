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
    
    private var selectPhotoButton: UIButton = {
       let btn = UIButton()
        btn.setTitle("select photo", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .heavy)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 3
        btn.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return btn
    }()
    
    
    //MARK: - TextFields
    private let emailTextField = UITextField.setupTextField(placeholder: " Email...", secureText: false)
    private let fullNameTextField = UITextField.setupTextField(placeholder: " Full name...", secureText: false)
    private let nickNameTextField = UITextField.setupTextField(placeholder: " Your nick...", secureText: false)
    private let passWordTextField = UITextField.setupTextField(placeholder: " Password...", secureText: false)
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
        setupGesture()
    }
    //MARK: - stack for button and labels
    lazy var stack = UIStackView(arrangedSubviews: [emailTextField,fullNameTextField,
                                                    nickNameTextField,passWordTextField,
                                                    signUpButtoh])
     //MARK: - settings for components
    private func configureComponents() {
     view.backgroundColor = .white
     navigationController?.navigationBar.isHidden = true
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 200, height: 200))
        selectPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectPhotoButton.layer.cornerRadius = 200/2
       
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: selectPhotoButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 16, left: 40, bottom: 0, right: 40),size: .init(width: 0, height: 280))
        
        view.addSubview(allreadyHaveAccoutButton)
        allreadyHaveAccoutButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 30, right: 16))
        
    }
    
    //MARK: -  func goToPreviousVC
    @objc private func goToSignIn() {
       // navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Keyboard settings
    
    private func setupNotificationObserver() {
        //нвблюдатель за клавой показалась
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoarShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //спряталась
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoarHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
   //обязательно вызвать метод
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc fileprivate func handleKeyBoarShow(notification: Notification ) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = value.cgRectValue
        
        let bottomSpace = view.frame.height - stack.frame.origin.y - stack.frame.height
        let difference = keyboardFrame.height - bottomSpace
        self.view.transform = CGAffineTransform(translationX: 0, y: -difference - 10)
         
    }
    
    @objc fileprivate func handleKeyBoarHide(notification: Notification ) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1,initialSpringVelocity: 1,options: .curveEaseOut,animations:  {
            self.view.transform = .identity
        },completion: nil )
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

//origin  место где заканчивается вью
