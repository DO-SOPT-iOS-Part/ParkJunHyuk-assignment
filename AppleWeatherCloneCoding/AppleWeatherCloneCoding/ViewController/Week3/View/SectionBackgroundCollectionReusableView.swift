//
//  SectionBackgroundCollectionReusableView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/08.
//

import UIKit

class SectionBackgroundCollectionReusableView: UICollectionReusableView {
    
    static let kind = "SectionBackgroundCollectionReusableView"
    static let identifier = "SectionBackgroundCollectionReusableView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = .sectionBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
