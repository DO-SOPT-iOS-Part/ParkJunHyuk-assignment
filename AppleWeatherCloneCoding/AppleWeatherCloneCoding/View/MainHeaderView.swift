//
//  MainHeaderView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/17.
//

import UIKit

class MainHeaderView: UIView {

    // MARK: - Property
    
    private lazy var topIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ellipsis.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = .bold(size: 36)
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        
        [topIconImageView, titleLabel].forEach {
            self.addSubview($0)
        }
        
        topIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(1)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(topIconImageView.snp.leading).inset(234)
            make.bottom.equalToSuperview()
        }
    }

}
