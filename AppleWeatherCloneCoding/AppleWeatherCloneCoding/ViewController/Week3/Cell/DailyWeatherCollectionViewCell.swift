//
//  DailyWeatherCollectionViewCell.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/07.
//

import UIKit
import Then
import SnapKit

final class DailyWeatherCollectionViewCell: UICollectionViewCell {
    // MARK: - Property
    
    static let identifier: String = "DailyWeatherCollectionViewCell"
    
    private var weekLabel = UILabel().then {
        $0.font = .medium(size: 22)
    }
    
    private var weatherImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    private var precipitation = UILabel().then {
        $0.font = .semibold(size: 15)
        $0.textColor = .precipitationColor
        $0.numberOfLines = 1
    }
    
    private var maxTemperature = UILabel().then {
        $0.font = .medium(size: 22)
        $0.textColor = .white
    }
    
    private let temperatureRangeView = TemperatureRangeView(frame: CGRect(x: 0, y: 0, width: 100, height: 4))
    
    private var minTemperature = UILabel().then {
        $0.font = .medium(size: 22)
        $0.textColor = .minTempColor
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [weatherImage, precipitation]).then {
        $0.axis = .vertical
        $0.distribution = .fill
    }
    
    private lazy var TempstackView = UIStackView(arrangedSubviews: [minTemperature, containView, maxTemperature]).then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 5
    }

    private let containView = UIView()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.layer.addBorder([.bottom], color: .minTempColor, width: 0.4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setLayout() {

        [weekLabel, stackView,TempstackView].forEach {
            self.addSubview($0)
        }
        
        containView.addSubview(temperatureRangeView)

        weekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(15)
        }

        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(84)
            $0.width.equalTo(33)
            $0.trailing.equalTo(TempstackView.snp.leading).inset(-14)
        }
        
        TempstackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
        }

        temperatureRangeView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(4)
        }
    }
    
    // MARK: - methods

    func bindData(dailyWeatherInfo: DailyWeatherInfo) {
        weekLabel.text = dailyWeatherInfo.week
        
        weatherImage.setSFsymbolImage(name: dailyWeatherInfo.weather, size: 22.0)

        maxTemperature.text = "\(dailyWeatherInfo.maxTemperature)°"
        minTemperature.text = "\(dailyWeatherInfo.minTemperature)°"
        
        if !(dailyWeatherInfo.precipitation.isEmpty) {
            precipitation.text = "\(String(describing: dailyWeatherInfo.precipitation))%"
        }
        
        let max = Double(dailyWeatherInfo.maxTemperature) ?? 0
        let min = Double(dailyWeatherInfo.minTemperature) ?? 0
        
        temperatureRangeView.bindData(min: min, max: max)
    }
}
