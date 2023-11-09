//
//  DetailWeatherHeaderView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/07.
//

import UIKit
import Then

final class DetailWeatherHeaderView: UIView {
    
    // MARK: - Property
    
    private lazy var verticalTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, temperatureLabel, weatherLabel, maxMinTempLabel, smallTempWeatherLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 4
        smallTempWeatherLabel.isHidden = true
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
    
    private var smallTempWeatherLabel = UILabel().then {
        $0.font = .medium(size: 19)
        $0.textColor = .white
    }
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
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
        
        smallTempWeatherLabel.text = "\(headerInfo.temperature)° | \(headerInfo.weather)"
    }
    
    /// Scroll 해서 바뀐 yOffset 만큼 해당 요소의 alpha 를 바꾸고 isHidden 을 설정
    func updateView(forScrollOffset yOffset: CGFloat) {
        
        let maxMinTempLabelAlpha = max((24 - yOffset) / (24 - 0), 0)
        let weatherLabelAlpha = max((48 - yOffset) / (48 - 24), 0)
        let temperatureLabelAlpha = max((119 - yOffset) / (119 - 48), 0)
        let smallTempWeatherLabelAlpha = min((yOffset - 172) / (172 - 119) + 1, 1)
        
        maxMinTempLabel.alpha = maxMinTempLabelAlpha
        weatherLabel.alpha = weatherLabelAlpha
        temperatureLabel.alpha = temperatureLabelAlpha
        smallTempWeatherLabel.alpha = smallTempWeatherLabelAlpha
        
        maxMinTempLabel.isHidden = weatherLabelAlpha < 0.05 ? true : false
        weatherLabel.isHidden = temperatureLabelAlpha < 0.05 ? true : false
        temperatureLabel.isHidden = smallTempWeatherLabelAlpha > 0.3 ? true : false
        
        smallTempWeatherLabel.isHidden = temperatureLabel.isHidden == true ? false : true
    }
}
