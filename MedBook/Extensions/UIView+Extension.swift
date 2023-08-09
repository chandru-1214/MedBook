//
//  UIView+Extension.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit

extension UIView {
    
    
    func setBorder(radius: CGFloat, color: UIColor, width: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func setCornerRadius(radius: CGFloat, color: UIColor, width: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
