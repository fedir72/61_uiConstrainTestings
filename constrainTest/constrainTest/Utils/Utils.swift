//
//  Utils.swift
//  constrainTest
//
//  Created by fedir on 06.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

import UIKit
//MARK: -  bicolor text Button
extension UIButton {
    class func BicolorButton(textPart1: String,textPart2: String) -> UIButton {
         let but = UIButton(type: .system)
                 //первая часть кнопки
                 let arributeTitle = NSMutableAttributedString(string: textPart1, attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor:  UIColor.lightGray ] )
                 //вторая часть кнопки
                 arributeTitle.append(NSAttributedString(string: textPart2, attributes: [.font: UIFont.systemFont(ofSize: 18) , .foregroundColor: UIColor.systemBlue]))
                 but.setAttributedTitle(arributeTitle, for: .normal)
                 //MARK: - переход на следующий контроллер
                 //but.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
           
                 return but    }
}

extension UIButton {
    
    
//MARK: - ( extension UIButton )создание кнопки
    
    class func setupButton(title: String,backColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = backColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        button.layer.cornerRadius = 20
        button.isEnabled = false //кнопка не работает
        return button
    }
}

//MARK: -

extension UITextField {
    class func setupTextField(placeholder: String,secureText: Bool?) -> UITextField {
        let lbl = CustomField(padding: 16) //применение метода CustomField
        lbl.placeholder = placeholder
        lbl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //lbl.borderStyle = .roundedRect
        lbl.layer.cornerRadius = 20
        lbl.isSecureTextEntry = secureText!
        lbl.font = UIFont.systemFont(ofSize: 20)
        return lbl
    }
}

extension UIColor {
  // расширение для цвета
    static func rgb(red: CGFloat, green: CGFloat,blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

//MARK: -
struct AnchoredConstraints {
    
    var top,leading,bottom,trailing,width,height: NSLayoutConstraint?
}
// ссылка на исходный урок
// Reference Video: https://youtu.be/iqpAP7s3b-8

//MARK: - расширение для вью для установки констрейнтов

extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?,leading: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?,trailing: NSLayoutXAxisAnchor?,padding: UIEdgeInsets = .zero,size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var ancoredConstrains = AnchoredConstraints()
        
        if let top =  top {
            ancoredConstrains.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            ancoredConstrains.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            ancoredConstrains.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            ancoredConstrains.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            ancoredConstrains.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            ancoredConstrains.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [ancoredConstrains.top,ancoredConstrains.leading,ancoredConstrains.bottom,ancoredConstrains.trailing,ancoredConstrains.width,ancoredConstrains.height].forEach{$0?.isActive = true }
        
        return ancoredConstrains
        
    }
    
    //fill entire view
    
    func fillSuperView(padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superViewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superViewTopAnchor, constant: padding.top).isActive =  true
        }
        
        if let superVieBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superVieBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superViewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superViewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superViewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superViewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperView(size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
         if let superviewCenterYAnchor = superview?.centerYAnchor {
                   centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
               }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}
