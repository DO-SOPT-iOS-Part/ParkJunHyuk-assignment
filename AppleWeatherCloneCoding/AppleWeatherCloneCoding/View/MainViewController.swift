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
    private var mainHeaderView = MainHeaderView()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "도시 또는 공항 검색"
        searchBar.barTintColor = .clear
        return searchBar
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setLayout()
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        [mainHeaderView, searchBar, mainStackView].forEach {
            contentView.addSubview($0)
        }

        for (index, data) in weatherData.enumerated() {
            let weatherDataView = WeatherDataView()
            weatherDataView.bindingData(weatherData: data, identifier: index)
            
            // 생성된 WeatherDataView를 mainStackView에 추가
            mainStackView.addArrangedSubview(weatherDataView)
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(weatherDataViewTapped(_:)))
            weatherDataView.addGestureRecognizer(tapGestureRecognizer)
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            make.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            make.width.equalTo(scrollView.snp.width)
        }
        
        mainHeaderView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.bottom.equalTo(searchBar.snp.top).offset(-8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.bottom.equalTo(mainStackView.snp.top).offset(-15)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
        
        searchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalTo(searchBar)
            make.height.equalTo(40)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.bottom.equalTo(contentView.snp.bottom)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
    }
    
    // MARK: - methods
    
    @objc private func weatherDataViewTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view as? WeatherDataView {
            print(tappedView.identifier ?? 0)
        }
    }
}

