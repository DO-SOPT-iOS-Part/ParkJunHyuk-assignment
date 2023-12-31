//
//  Color+Extension.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/17.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIColor {
    static var backgroundTextFieldColor: UIColor {
        return UIColor(rgb: 0x1A1A1A)
    }
    
    static var headerTitleColor: UIColor {
        return UIColor(rgb: 0x62666D)
    }
    
    static var minTempColor: UIColor {
        return UIColor(rgb: 0x6C7079)
    }
    
    static var progressColor: UIColor {
        return UIColor(rgb: 0x262B36)
    }
    
    static var sectionBackgroundColor: UIColor {
        return UIColor(rgb: 0x2D3340) 
    }
    
    static var highTemperatureColor: UIColor {
        return UIColor(rgb: 0xEF8835)
    }
    
    static var rowTemperatureColor: UIColor {
        return UIColor(rgb: 0xB5CF79)
    }
    
    static var precipitationColor: UIColor {
        return UIColor(rgb: 0x81CFFA)
    }
    
}
