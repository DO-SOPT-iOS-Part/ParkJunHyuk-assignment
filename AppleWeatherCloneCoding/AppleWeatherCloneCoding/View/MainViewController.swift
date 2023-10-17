//
//  ViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/16.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Property
    
    private var scrollView: UIScrollView = UIScrollView()
    private var contentView: UIView = UIView()
    private lazy var weatherDataView = WeatherDataView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [weatherDataView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            make.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            make.width.equalTo(scrollView.snp.width)
        }
        
        weatherDataView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(160)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(100)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.equalTo(117)
        }
    }
    
    // MARK: - methods
}

