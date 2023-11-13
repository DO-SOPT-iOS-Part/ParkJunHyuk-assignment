//
//  TimeWeatherDataCollectionViewCell.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/03.
//

import UIKit
import Then

class TimeWeatherDataCollectionViewCell: UICollectionViewCell {
    // MARK: - Property
    
    static let identifier: String = "TimeWeatherDataCollectionViewCell"

    var timeLabel = UILabel().then {
        $0.font = .medium(size: 17)
    }
    
    private var weatherImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private var temperatureLabel = UILabel().then {
        $0.font = .medium(size: 22)
        $0.textColor = .white
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [timeLabel, weatherImageView, temperatureLabel]).then {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.spacing = 19
    }

    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bindData(timeWeatherInfo: TimeWeatherInfo) {
        timeLabel.text = timeWeatherInfo.time
        weatherImageView.image = UIImage(named: "\(timeWeatherInfo.weather)")
        temperatureLabel.text = "\(timeWeatherInfo.temperature)°"
    }
}
