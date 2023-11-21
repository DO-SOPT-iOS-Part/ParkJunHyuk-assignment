//
//  Week4DetailWeatherViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/17.
//

import UIKit

final class Week4DetailWeatherViewController: UIViewController {

    // MARK: - Property
    private(set) var identifier = 0
    private let verticalScrollView = UIScrollView()
    private let contentView = UIView()
    private let timeWeatherDataView = TimeWeatherDataView()
    
    private lazy var verticalTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, temperatureLabel, weatherLabel, maxMinTempLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(size: 36)
        label.textColor = .white
        return label
    }()
    
    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .thin(size: 100)
        label.textColor = .white
        return label
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(size: 24)
        label.textColor = .white
        return label
    }()
    
    private var maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 20)
        label.textColor = .white
        return label
    }()
    
    private var minTempLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 20)
        label.textColor = .white
        return label
    }()
    
    private var backgroundView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "BackgroundImage"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setLayout()
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        [backgroundView, verticalScrollView].forEach {
            self.view.addSubview($0)
        }
        
        verticalScrollView.addSubview(contentView)
        
        [verticalTopStackView, timeWeatherDataView].forEach {
            contentView.addSubview($0)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        verticalScrollView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(verticalScrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(verticalScrollView.contentLayoutGuide.snp.leading)
            make.bottom.equalTo(verticalScrollView.contentLayoutGuide.snp.bottom)
            make.trailing.equalTo(verticalScrollView.contentLayoutGuide.snp.trailing)
            make.width.equalTo(verticalScrollView.snp.width)
        }
        
        verticalTopStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(78)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        timeWeatherDataView.snp.makeConstraints { make in
            make.top.equalTo(verticalTopStackView.snp.bottom).offset(44)
            make.leading.equalTo(contentView.snp.leading).inset(22)
            make.trailing.equalTo(contentView.snp.trailing).inset(22)
            make.bottom.equalTo(contentView.snp.bottom).offset(-246)
        }
    }
    
    // MARK: - methods
    
    func bindData(weatherData: OpenWeatherData, identifier: Int) {
        self.identifier = identifier
        locationLabel.text = weatherData.name
        
        weatherData.weather.forEach { data in
            weatherLabel.text = data.main
        }
        
        temperatureLabel.text = "\(Int(weatherData.main.temp))°"
        maxMinTempLabel.text = "최고:\(Int(weatherData.main.tempMax))° 최저:\(Int(weatherData.main.tempMin))°"
        
//        timeWeatherDataView.bindingData(timeWeatherData: weatherData.timeWeatherData)
    }
}

