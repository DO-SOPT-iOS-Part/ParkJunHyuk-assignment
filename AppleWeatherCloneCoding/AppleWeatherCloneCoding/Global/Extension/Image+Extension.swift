//
//  Image+Extension.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/09.
//

import Foundation
import UIKit

extension UIImageView {
    func setSFsymbolImage(name: String, size: CGFloat) {
        
        var color: [UIColor] = []
        
        switch name {
        case "sun.max.fill" :
            color = [.systemYellow]
            
        case "cloud.drizzle.fill" :
            color = [.white, .white]
            
        case "cloud.sun.fill":
            color = [.white, .systemYellow]
            
        default:
            break
        }
        
        
        let symbolConfiguration = UIImage.SymbolConfiguration(paletteColors: color)
        
        let resizedConfiguration = symbolConfiguration.applying(UIImage.SymbolConfiguration(pointSize: size))
        
        let image = UIImage(systemName: "\(name)", withConfiguration: resizedConfiguration)
        
        self.image = image
    }
}

