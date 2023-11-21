//
//  Week4MainViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/14.
//

import UIKit
import SnapKit
import Then

class Week4MainViewController: UIViewController {
    
    // MARK: - Property
    
    private var forecastInfo: [OpenWeatherData?] = []
    private var searchResult: [OpenWeatherData?] = []
    
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
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationTitle()
        setLayout()
        setDelegate()
        setTableViewConfig()
        fetchWeatherData()
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
        self.tableView.register(Week4WeatherTableViewCell.self, forCellReuseIdentifier: Week4WeatherTableViewCell.identifier)
    }
    
    // MARK: - methods
    
    func fetchWeatherData() {
        let cities = ["seoul","busan","daejeon","sokcho","jeju"]
        
        Task {
            do {
                try await withThrowingTaskGroup(of: OpenWeatherData?.self, body: { group in
                    for city in cities {
                        group.addTask {
                            return try await GetInfoWeatherService.shared.GetRegisterData(cityName: city)
                        }
                    }
                    
                    for try await result in group {
                        if let data = result {
                            self.forecastInfo.append(data)
                        }
                    }
                })
                
                await MainActor.run {
                    forecastInfo.sort { ($0?.name ?? "") < ($1?.name ?? "") }
                    tableView.reloadData()
                }
            } catch {
                print("Error fetching weather data: \(error)")
            }
        }
    }
}

// MARK: - extension

extension Week4MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.searchBar.text?.count ?? 0 > 0  ? searchResult.count : forecastInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Week4WeatherTableViewCell.identifier, for: indexPath) as? Week4WeatherTableViewCell else { return UITableViewCell() }
        
        if searchController.searchBar.text?.isEmpty == false {
            // 검색 상태일 때

            guard let search = searchResult[indexPath.row] else { return UITableViewCell() }

            cell.bindData(weatherData: search)
        } else {
            // 일반 상태일 때
            guard let info = forecastInfo[indexPath.row] else { return UITableViewCell() }

            cell.bindData(weatherData: info)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let pageViewController = Week4DetailWeatherPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.bindData(forecastInfo: forecastInfo, identifier: indexPath.row)
        
        navigationController?.pushViewController(pageViewController, animated: true)
    }
}

extension Week4MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        searchWeatherData(searchText: searchController.searchBar.text)
    }
    
    private func searchWeatherData(searchText: String?) {
        
        searchResult = forecastInfo.compactMap { $0 }.filter {
            $0.name.contains(searchText ?? "")
        }
        
        tableView.reloadData()
    }
}
