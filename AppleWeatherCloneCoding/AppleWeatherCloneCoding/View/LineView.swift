//
//  LineView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/26.
//

import UIKit


final class LineView: UIView {
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // CAShapeLayer 생성
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor // 선 색상 설정
        shapeLayer.lineWidth = 0.2 // 선의 두께 설정
        
        // UIBezierPath 생성
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height / 2)) // 시작점 설정
        path.addLine(to: CGPoint(x: frame.width, y: center.y)) // 끝점 설정

        // CAShapeLayer에 UIBezierPath 설정
        shapeLayer.path = path.cgPath
        
        // 뷰의 Layer에 CAShapeLayer 추가
        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
