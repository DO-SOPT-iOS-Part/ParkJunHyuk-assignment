//
//  Week3MainViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/01.
//

import UIKit

class Week3MainViewController: UIViewController {
    
    // MARK: - Property
    
    private var forecastInfo: [ForecastInfo] = []
    
    private var tableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    private lazy var topIconImageView = UIImageView().then {
        $0.image = UIImage(named: "ellipsis.circle")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchResult: [ForecastInfo] = []

    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationTitle()
        setLayout()
        setDelegate()
        setTableViewConfig()
        loadWeatherData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - layouts
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setNavigationTitle() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "도시 또는 공항 검색"
        
        navigationItem.searchController = searchController
        navigationItem.title = "날씨"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: topIconImageView)
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
    }
    
    // MARK: - methods
    
    func loadWeatherData() {
        guard let url = Bundle.main.url(forResource: "Weather", withExtension: "json") else {
            print("JSON 파일을 찾을 수 없습니다.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let forecastData = try decoder.decode(ForecastData.self, from: data)
            self.forecastInfo = forecastData.forecastInfo

        } catch {
            print("JSON 디코드 중 오류 발생: \(error)")
        }
    }
}

// MARK: - extension

extension Week3MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchController.searchBar.text?.count ?? 0 > 0  ? searchResult.count : forecastInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
                
        cell.bindingData(weatherData: searchController.searchBar.text?.count ?? 0 > 0 ? searchResult[indexPath.row] : forecastInfo[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
 
//        let pageViewController = Week3DetailWeatherViewController()
//        pageViewController.bindData(forecaseInfo: forecastInfo[indexPath.row], identifier: indexPath.row)
        
        let pageViewController = DetailWeatherPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.bindingData(weatherData: weatherData, identifier: identifier)
        
        navigationController?.pushViewController(pageViewController, animated: true)
    }
}

extension Week3MainViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        searchWeatherData(searchText: searchController.searchBar.text)
    }
    
    private func searchWeatherData(searchText: String?) {
        searchResult = forecastInfo.filter { $0.headerInfo.location.contains(searchText ?? "") }
        tableView.reloadData()
    }
}
