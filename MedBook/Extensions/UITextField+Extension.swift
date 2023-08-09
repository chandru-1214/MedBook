//
//  UITextField+Extension.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit

extension UITextField {
    
    func underlined(){
        let border = CALayer()
        let width: CGFloat = 1.0
        border.borderColor = UIColor.blackColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
