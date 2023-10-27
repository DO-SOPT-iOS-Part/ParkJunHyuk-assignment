//
//  DetailWeatherPageViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/26.
//

import UIKit

class DetailWeatherPageViewController: UIPageViewController {
    
    // MARK: - Property
    
    private var weatherData: [WeatherData] = []
    private var currentIndex = 0
    private lazy var detailWeatherViewControllers: [DetailWeatherViewController] = []
    private var tabBarView = TabBarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 82))

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        tabBarView.delegate = self
        tabBarView.bindingData(dataCount: weatherData.count)
        
        selectedViewControllerSetting()
        setLayout()
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        view.addSubview(tabBarView)
        
        tabBarView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(82)
        }
    }
        
    // MARK: - methods
    
    private func createDetailWeatherViewController(index: Int) -> DetailWeatherViewController? {
        guard index >= 0, index < weatherData.count else {
            return nil
        }

        let weatherData = weatherData[index]
        let detailVC = DetailWeatherViewController()
        detailVC.bindingData(weatherData: weatherData, identifier: index)

        return detailVC
    }
    
    func bindingData(weatherData: [WeatherData], identifier: Int) {
        self.weatherData = weatherData
        self.currentIndex = identifier
    }
}

// MARK: - extension

extension DetailWeatherPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? DetailWeatherViewController,
                      let currentIndex = weatherData.firstIndex(where: { $0.identifier == currentVC.identifier }),
              currentIndex > 0 else { return nil }

        self.currentIndex -= 1
        return createDetailWeatherViewController(index: currentIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? DetailWeatherViewController,
                      let currentIndex = weatherData.firstIndex(where: { $0.identifier == currentVC.identifier }),
                      currentIndex < weatherData.count - 1 else { return nil }
        

        self.currentIndex += 1
        return createDetailWeatherViewController(index: currentIndex + 1)
    }
    
    func selectedViewControllerSetting() {
        if let selectViewController = createDetailWeatherViewController(index: currentIndex) {
            setViewControllers([selectViewController], direction: .forward, animated: false)
        }
    }
}

extension DetailWeatherPageViewController: TabBarViewDelegate {
    func listButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
