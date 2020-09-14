//
//  CustomField.swift
//  constrainTest
//
//  Created by fedir on 13.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class CustomField : UITextField {
    let padding: CGFloat
    init(padding: CGFloat) {
        self.padding = padding
        super.init(frame: .zero)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 50)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
