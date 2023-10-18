//
//  WeatherDataView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/17.
//

import UIKit
import SnapKit

class WeatherDataView: UIView {
    
    // MARK: - Property
    
    var identifier: Int?
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalTopStackView, horizontalBottomStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalLocationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, locationLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()

    private lazy var horizontalTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [verticalLocationStackView, temperatureLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var horizontalBottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weatherLabel, maxTempLabel, minTempLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 6
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(size: 24)
        label.text = "나의 위치"
        label.textColor = .white
        label.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 17)
        label.text = "인천광역시"
        label.textColor = .white
        label.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .light(size: 52)
        label.text = "21°"
        label.textColor = .white
        return label
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 16)
        label.text = "흐림"
        label.textColor = .white
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 15)
        label.text = "최고:29°"
        label.textColor = .white
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 15)
        label.text = "최저:15°"
        label.textColor = .white
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

        self.addSubview(backgroundView)
        backgroundView.addSubview(mainStackView)
        
        backgroundView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(117)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(10)
            make.bottom.equalTo(backgroundView).offset(-10)
            make.leading.trailing.equalTo(backgroundView).inset(16)
        }
    }
    
    // MARK: - methods
    func bindingData(weatherData: WeatherData, identifier: Int) {
        self.identifier = identifier
        titleLabel.text = weatherData.myLocation
        locationLabel.text = weatherData.location
        weatherLabel.text = weatherData.weather
        temperatureLabel.text = "\(weatherData.temperature)°"
        maxTempLabel.text = "최고:\(weatherData.maxTemperature)°"
        minTempLabel.text = "최저:\(weatherData.minTemperature)°"
    }
}
