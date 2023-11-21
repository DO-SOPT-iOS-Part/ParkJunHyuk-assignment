//
//  DetailWeatherPageViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/14.
//

import UIKit

class Week4DetailWeatherPageViewController: UIPageViewController {

    // MARK: - Property
    
    private var forecastInfo: [OpenWeatherData?] = []
    private lazy var detailWeatherViewControllers: [Week4DetailWeatherViewController] = []
    private var currentIndex = 0
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
    
    private func createDetailWeatherViewController(index: Int) -> Week4DetailWeatherViewController? {
        guard index >= 0, index < forecastInfo.count, let weatherData = forecastInfo[index] else {
            return nil
        }

        let detailViewController = Week4DetailWeatherViewController()
        detailViewController.bindData(weatherData: weatherData, identifier: index)

        return detailViewController
    }
    
    func bindData(forecastInfo: [OpenWeatherData?], identifier: Int) {
        self.forecastInfo = forecastInfo
        self.currentIndex = identifier
    }

}

// MARK: - extension

extension Week4DetailWeatherPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      
        guard let currentVC = viewController as? Week4DetailWeatherViewController ,currentVC.identifier > 0 else { return nil }
        
        self.currentIndex -= 1
        return createDetailWeatherViewController(index: currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? Week4DetailWeatherViewController ,currentVC.identifier < forecastInfo.count - 1 else { return nil }
        
        self.currentIndex += 1
        return createDetailWeatherViewController(index: currentIndex)
    }
    
    func selectedViewControllerSetting() {
        if let selectViewController = createDetailWeatherViewController(index: currentIndex) {
            setViewControllers([selectViewController], direction: .forward, animated: false)
        }
    }
}

extension Week4DetailWeatherPageViewController: TabBarViewDelegate {
    func listButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

