//
//  View+Extension.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/08.
//

import UIKit

extension UIView {
    func applyGradient(colors: [UIColor], locations: [NSNumber]? = nil) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        // 기존 그라디언트 레이어를 제거하고 새로운 레이어를 추가합니다.
        if let oldLayer = (self.layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
            self.layer.replaceSublayer(oldLayer, with: gradientLayer)
        } else {
            self.layer.cornerRadius = 2
            self.clipsToBounds = true
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
