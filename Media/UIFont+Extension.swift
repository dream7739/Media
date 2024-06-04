//
//  UIFont+Extension.swift
//  Media
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit

enum FontType {
    case extream
    case primary
    case secondary
    case tertiary
    case quaternary
    
    var customFont: UIFont {
        switch self{
        case .extream:
            return UIFont.systemFont(ofSize: 40, weight: .heavy)
        case .primary:
            return UIFont.systemFont(ofSize: 17, weight: .bold)
        case .secondary:
            return UIFont.systemFont(ofSize: 15, weight: .medium)
        case .tertiary:
            return UIFont.systemFont(ofSize: 13, weight: .medium)
        case .quaternary:
            return UIFont.systemFont(ofSize: 10, weight: .medium)

        }
    }
}

extension UIFont {
    static var extream: UIFont {
        return FontType.extream.customFont
    }
    
    static var tertiary: UIFont {
        return FontType.tertiary.customFont
    }
    
    static var primary: UIFont {
        return FontType.primary.customFont
    }
    
    static var secondary: UIFont {
        return FontType.secondary.customFont
    }
    
    
    

}
