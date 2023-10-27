//
//  TimeWeatherDataView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/19.
//

import UIKit

final class TimeWeatherDataView: UIView {

    // MARK: - Property
    
    private var contentView: UIView = UIView()
    private let topStackContainer = UIView()
    private let lineStackContainer = UIView()
    private let lineView = LineView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 0))
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private var verticalMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var horizontalTodayWeatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 22
        return stackView
    }()

    private var todayForecastLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .regular(size: 18)
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(white: 1.0, alpha: 0.1).cgColor
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        self.addSubview(verticalMainStackView)

        [topStackContainer, lineStackContainer, scrollView].forEach {
            verticalMainStackView.addArrangedSubview($0)
        }
        
        topStackContainer.addSubview(todayForecastLabel)
        lineStackContainer.addSubview(lineView)
        scrollView.addSubview(contentView)
        contentView.addSubview(horizontalTodayWeatherStackView)

        verticalMainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        todayForecastLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(topStackContainer).inset(15)
            make.bottom.equalToSuperview().inset(11)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(lineStackContainer).offset(15)
            make.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(scrollView.contentLayoutGuide.snp.leading).offset(15)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            make.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing).offset(-15)
            make.height.equalTo(scrollView.snp.height)
        }
        
        horizontalTodayWeatherStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(14)
            make.leading.equalTo(contentView.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    // MARK: - methods
    
    func bindingData(timeWeatherData: [TimeWeatherData]) {
        timeWeatherData.forEach { data in
            horizontalTodayWeatherStackView.addArrangedSubview(createVerticalTimeWeatherStackView(data: data))
        }
    }
    
    private func createVerticalTimeWeatherStackView(data: TimeWeatherData) -> UIStackView {
        let timeLabel = UILabel()
        timeLabel.font = .medium(size: 17)
        timeLabel.text = data.time

        let weatherImageView = UIImageView()
        weatherImageView.contentMode = .scaleAspectFit
        weatherImageView.clipsToBounds = true
        weatherImageView.image = UIImage(named: "\(data.weather)")

        let temperatureLabel = UILabel()
        temperatureLabel.font = .medium(size: 22)
        temperatureLabel.textColor = .white
        temperatureLabel.text = "\(data.temperature)°"
        
        let stackView = UIStackView(arrangedSubviews: [timeLabel, weatherImageView, temperatureLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 19
        
        return stackView
    }
}
