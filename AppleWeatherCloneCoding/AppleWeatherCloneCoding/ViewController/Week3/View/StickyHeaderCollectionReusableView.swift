//
//  StickyHeaderCollectionReusableView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/07.
//

import UIKit
import Then

class StickyHeaderCollectionReusableView: UICollectionReusableView {

    static let elementKind = "StickyHeaderCollectionReusableView"
    static let identifier = "StickyHeaderCollectionReusableView"

    private lazy var headerImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .headerTitleColor
    }
    
    private var headerTitle = UILabel().then {
        $0.font = .medium(size: 15)
        $0.textColor = .headerTitleColor
    }
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = .sectionBackgroundColor
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        self.addSubview(headerImage)
        self.addSubview(headerTitle)
        
        headerImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().inset(15)
        }
        
        headerTitle.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.equalTo(headerImage.snp.trailing).offset(5)
        }
    }
    
    func bindData(section: Int, text: String) {
        headerImage.image = UIImage(systemName: section == 0 ? "clock" : "calendar")
        self.headerTitle.text = text
    }
}
