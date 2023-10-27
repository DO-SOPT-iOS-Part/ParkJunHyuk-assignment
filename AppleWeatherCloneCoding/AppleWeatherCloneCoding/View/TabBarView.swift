//
//  TabBarView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/26.
//

import UIKit

class TabBarView: UIView {

    // MARK: - Property
    
    private var dataCount: Int?
    weak var delegate: TabBarViewDelegate?
    
    private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 4, left: 10, bottom: 14, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 50
        return stackView
    }()
    
    private var horizontalMiddleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "map"), for: .normal)
        return button
    }()
    
    private lazy var circleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circle"), for: .normal)
        return button

    }()
    
    private lazy var loactionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "location"), for: .normal)
        return button
    
    }()
    
    private lazy var listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "listBullet.circle"), for: .normal)
        button.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addBorder([.top], color: UIColor.white, width: 0.4)
        self.backgroundColor = UIColor(rgb: 0x2A3040)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        [mapButton, horizontalMiddleStackView, listButton].forEach {
            self.addSubview($0)
        }
        
        [loactionButton].forEach {
            horizontalMiddleStackView.addArrangedSubview($0)
        }
        
        mapButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(10)
        }
        
        horizontalMiddleStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.centerX.equalToSuperview()
        }
        
        listButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(9)
        }
    }
    
    private func createCircleButton() {
        for _ in 1..<(dataCount ?? 0) {
            let button = UIButton()
            button.setImage(UIImage(named: "circle"), for: .normal)
            horizontalMiddleStackView.addArrangedSubview(button)
        }
    }
    
    @objc func listButtonTapped() {
        delegate?.listButtonDidTap()
    }
    
    func bindingData(dataCount: Int) {
        self.dataCount = dataCount
        createCircleButton()
    }
}


protocol TabBarViewDelegate: AnyObject {
    func listButtonDidTap()
}
