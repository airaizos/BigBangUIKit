//
//  Extensiones.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 30/3/23.
//

import UIKit


extension Notification.Name {
    static let favoritesChanged = Notification.Name("FAVORITESCHANGED")
    static let watchedChanged = Notification.Name("WATCHEDCHANGED")
    static let checkChanged = Notification.Name("CHECKCHANGED")
    static let ratingChanged = Notification.Name("RATINGCHANGED")
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue
              layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor:UIColor? {
        get { layer.borderColor.flatMap { UIColor(cgColor: $0) } }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowColor:UIColor? {
        get { layer.shadowColor.flatMap { UIColor(cgColor: $0) } }
        set { layer.shadowColor = UIColor.black.cgColor }
        }
    
    @IBInspectable var shadowRadius:CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
        }
    @IBInspectable var shadowOffset:CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
        }
    @IBInspectable var shadowOpacity:Float {
        get { layer.shadowOpacity}
        set { layer.shadowOpacity = newValue }
        }
}


extension UIColor {
    static let BBTYellow = UIColor(named: "BBTYellow")
    static let BBTWhite = UIColor(named: "BBTWhite")
    static let BBTRed = UIColor(named: "BBTRed")
    static let BBTPale = UIColor(named: "BBTPale")
    static let BBTGreen = UIColor(named: "BBTGreen")
    static let BBTGray = UIColor(named: "BBTGray")
    static let BBTBlue = UIColor(named: "BBTBlue")
    static let BBTBlack = UIColor(named: "BBTBlack")
    static let BBTGreenish = UIColor(named: "BBTGreenish")
    static let BBTOcher = UIColor(named: "BBTOcher")
    static let BBTRedish = UIColor(named: "BBTRedish")
}


extension UIImage {
    
  
}



