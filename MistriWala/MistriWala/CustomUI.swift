//
//  CustomUI.swift
//  MistriWala
//
//  Created by Bharat Silavat on 06/02/23.
//

import Foundation
import UIKit
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            
            
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return .clear
            }
        }
        set {
            self.layer.borderColor = newValue.cgColor
            
            
        }
    }
    
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    
    @IBInspectable var shadowColor: UIColor {
        get {
            if let color = self.layer.shadowColor {
                return UIColor(cgColor: color)
            } else {
                return .clear
            }
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
}
