//
//  ConerRadiusView.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 25/05/2022.
//

import UIKit

extension UIView {
    @IBInspectable var conerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value){
            clipsToBounds = true
            layer.cornerRadius = value
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        set(value){
            layer.borderColor = value?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
            
        }
        set(value){
            layer.borderWidth = value
        }
    }
    
}

