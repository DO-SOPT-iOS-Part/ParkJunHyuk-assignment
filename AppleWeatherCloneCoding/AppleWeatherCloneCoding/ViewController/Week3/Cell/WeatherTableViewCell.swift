//
//  WeatherTableViewCell.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/01.
//

import UIKit
import Then

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    static let identifier: String = "WeatherDataTableViewCell"

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    
    private let cellBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        $0.layer.cornerRadius = 16
    }
    
    private let mainStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 16
    }

    private lazy var verticalLocationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myLocationLabel, locationLabel])
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
    
    private lazy var myLocationLabel: UILabel = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        
        self.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(mainStackView)
        
        [horizontalTopStackView, horizontalBottomStackView].forEach {
            mainStackView.addArrangedSubview($0)
        }
        
        cellBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(cellBackgroundView).offset(10)
            $0.bottom.equalTo(cellBackgroundView).inset(10)
            $0.leading.trailing.equalTo(cellBackgroundView).inset(16)
        }
    }
    
    // MARK: - Method
    
    func bindingData(weatherData: ForecastInfo) {
        myLocationLabel.text = weatherData.headerInfo.myLocation
        locationLabel.text = weatherData.headerInfo.location
        weatherLabel.text = weatherData.headerInfo.weather
        temperatureLabel.text = "\(weatherData.headerInfo.temperature)°"
        maxTempLabel.text = "최고:\(weatherData.headerInfo.maxTemperature)°"
        minTempLabel.text = "최저:\(weatherData.headerInfo.minTemperature)°"
    }
}
