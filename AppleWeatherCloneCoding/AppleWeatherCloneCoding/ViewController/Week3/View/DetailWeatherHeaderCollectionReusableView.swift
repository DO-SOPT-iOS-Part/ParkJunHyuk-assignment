//
//  DetailWeatherHeaderCollectionReusableView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/09.
//

import UIKit

class DetailWeatherHeaderCollectionReusableView: UICollectionReusableView {
        
    static let elementKind = "DetailWeatherHeaderCollectionReusableView"
    static let identifier = "DetailWeatherHeaderCollectionReusableView"
    
    private var section: Int?
    
    private lazy var verticalTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, temperatureLabel, weatherLabel, maxMinTempLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private var locationLabel = UILabel().then {
        $0.font = .regular(size: 36)
        $0.textColor = .white
    }
    
    private var temperatureLabel = UILabel().then {
        $0.font = .thin(size: 100)
        $0.textColor = .white
    }
    
    private var weatherLabel = UILabel().then {
        $0.font = .regular(size: 24)
        $0.textColor = .white
    }
    
    private var maxMinTempLabel = UILabel().then {
        $0.font = .medium(size: 20)
        $0.textColor = .white
    }
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layouts
    
    private func setLayout() {

        self.addSubview(verticalTopStackView)
        
        verticalTopStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func bindData(headerInfo: HeaderInfo) {
        locationLabel.text = headerInfo.location
        weatherLabel.text = headerInfo.weather
        temperatureLabel.text = "\(headerInfo.temperature)°"
        maxMinTempLabel.text = "최고:\(headerInfo.maxTemperature)° 최저:\(headerInfo.minTemperature)°"
    }
}
