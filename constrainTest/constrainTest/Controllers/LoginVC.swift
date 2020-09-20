//
//  LoginVC.swift
//  constrainTest
//
//  Created by fedir on 04.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
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
    private let loginButtoh = UIButton.setupButton(title: "Login", backColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        
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
        
        handlers()
        
    }
    //MARK: - проверка введения пароля и кнопка
    private func handlers() {
        emailTextField.addTarget(self, action: #selector(formvalidation), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(formvalidation), for: .editingChanged)
        loginButtoh.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    //MARK: - проверка авторизации
    @objc private func handleLogin() {
        // print("handle login")
        guard let email = emailTextField.text,
            let pass = passwordTextField.text else {return}
        //проверка на наличие юзера с такими параметрами
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if let error = error {
                 //MARK: - alert
                   let avc = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
                   let action = UIAlertAction(title: "Exit", style: .destructive, handler: nil)
                   avc.addAction(action)
                   self.present(avc, animated: true, completion: nil)

                print("Error: user hasnt found",error.localizedDescription)
                return
            }else{
                //MARK: - удачный вход
                print("Successfuly signed in")
                let mvc = MainTabVC()
                mvc.modalPresentationStyle = .fullScreen
                self.present(mvc, animated: true, completion: nil)
                
            }
        }
        
    }
    
    //MARK: - проверка заполнения полей
    @objc private func formvalidation() {
       guard emailTextField.hasText,
        passwordTextField.hasText,
        passwordTextField.text!.count > 5
                else {
                self.loginButtoh.isEnabled = false
                self.loginButtoh.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                return }
        
        loginButtoh.isEnabled = true
        loginButtoh.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        print("Registration Done")
    }
    
    //MARK: - настройки текстфилдов
    private func configureComponents() {
        //navigationBar is hide
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(logocontainerwiev)
        logocontainerwiev.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing:view.trailingAnchor , padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 150))
        
        
      
        
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
