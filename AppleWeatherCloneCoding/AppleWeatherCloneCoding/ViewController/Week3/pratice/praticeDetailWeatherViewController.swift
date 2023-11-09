////
////  Week3DetailWeatherViewController.swift
////  AppleWeatherCloneCoding
////
////  Created by ParkJunHyuk on 2023/11/02.
////
//
//import UIKit
//import Then
//
//class Week3DetailWeatherViewController: UIViewController {
//    // MARK: - Property
//    
//    private(set) var identifier = 0
//    private var forecaseSection: [Section] = []
////    private let timeWeatherDataView = TimeWeatherDataView()
//    
//    private var backgroundView: UIImageView = {
//        let image = UIImageView(image: UIImage(named: "BackgroundImage"))
//        image.contentMode = .scaleAspectFill
//        return image
//    }()
//    
//    private var mainTableView = UITableView(frame: .zero, style: .plain).then {
//        $0.showsVerticalScrollIndicator = false
//        $0.separatorStyle = .none
//        $0.backgroundColor = .clear
//    }
//    
//    private lazy var verticalTopStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [locationLabel, temperatureLabel, weatherLabel, maxMinTempLabel])
//        stackView.axis = .vertical
//        stackView.distribution = .fill
//        stackView.alignment = .center
//        stackView.spacing = 4
//        stackView.backgroundColor = .clear
//        return stackView
//    }()
//    
//    private var locationLabel = UILabel().then {
//        $0.font = .regular(size: 36)
//        $0.textColor = .white
//    }
//    
//    private var temperatureLabel = UILabel().then {
//        $0.font = .thin(size: 100)
//        $0.textColor = .white
//    }
//    
//    private var weatherLabel = UILabel().then {
//        $0.font = .regular(size: 24)
//        $0.textColor = .white
//    }
//    
//    private var maxMinTempLabel = UILabel().then {
//        $0.font = .medium(size: 20)
//        $0.textColor = .white
//    }
//    
//    // MARK: - LifeCycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.navigationController?.navigationBar.isHidden = true
////        mainTableView.backgroundView = backgroundView
//        setLayout()
//        setDelegate()
//        setTableViewConfig()
//    }
//    
//    // MARK: - layouts
//        
//    private func setDelegate() {
//        mainTableView.delegate = self
//        mainTableView.dataSource = self
////        mainTableView.tableHeaderView = verticalTopStackView
////        verticalTopStackView.layoutIfNeeded()
////        mainTableView.tableHeaderView?.frame.size = verticalTopStackView.frame.size
//    }
//    
//    private func setLayout() {
//        [backgroundView, mainTableView ,verticalTopStackView ].forEach {
//            self.view.addSubview($0)
//        }
//        
//        backgroundView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//        
//        verticalTopStackView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(78)
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//        }
//        
//        mainTableView.snp.makeConstraints {
//            $0.top.equalTo(verticalTopStackView.snp.bottom)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//    }
//    
//    private func setTableViewConfig() {
//        mainTableView.register(TimeWeatherCollectionTableViewCell.self, forCellReuseIdentifier: TimeWeatherCollectionTableViewCell.identifier)
//        
//        mainTableView.register(DetailWeatherHeaderTableViewCell.self, forCellReuseIdentifier: DetailWeatherHeaderTableViewCell.identifier)
//    }
//    
//    // MARK: - methods
//    
//    func bindData(forecaseInfo: ForecastInfo, identifier: Int) {
//        self.identifier = identifier
//        self.forecaseSection = forecaseInfo.sections
//        locationLabel.text = forecaseInfo.headerInfo.location
//        weatherLabel.text = forecaseInfo.headerInfo.weather
//        temperatureLabel.text = "\(forecaseInfo.headerInfo.temperature)°"
//        maxMinTempLabel.text = "최고:\(forecaseInfo.headerInfo.maxTemperature)° 최저:\(forecaseInfo.headerInfo.minTemperature)°"
//        
////        timeWeatherDataView.bindingData(timeWeatherData: weatherData.timeWeatherData)
//    }
//    
//    
//}
//
//// MARK: - Extension
//
//extension Week3DetailWeatherViewController: UITableViewDelegate{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        switch section {
////        case 0:
////            let label = UILabel()
////            label.text = "10일간의 일기예보"
////            return label
////        case 1:
////            let label = UILabel()
////            label.text = "10일간의 일기예보"
////            return label
////        default:
////            return nil
////        }
////    }
//    
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        switch section {
////        case 0:
////            return 38
////        case 1:
////            return 38
////        default:
////            return 0
////        }
////    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 0:
//            // UICollectionView의 높이에 맞추어 적절한 높이 반환
//            if indexPath.row == 1 {
//                return 122 + 24 
//            } else {
//                return 38
//            }
//        case 1:
//            // 다른 셀의 높이
//            return 20
//        default:
//            return 0
//        }
//    }
//}
//
//extension Week3DetailWeatherViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 2
//        case 1:
//            return 11
//        default:
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0:
//            if indexPath.row == 0 {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailWeatherHeaderTableViewCell.identifier, for: indexPath) as? DetailWeatherHeaderTableViewCell else { return UITableViewCell() }
//                
//                cell.bindData(section: indexPath.section, text: "시간별 일기예보")
//                return cell
//                
//            } else {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: TimeWeatherCollectionTableViewCell.identifier, for: indexPath) as? TimeWeatherCollectionTableViewCell else { return UITableViewCell() }
//                
//                cell.bindData(section: forecaseSection[indexPath.section])
//
//                return cell
//            }
//            
//        case 1:
//            let cell = UITableViewCell()
//            cell.backgroundColor = .clear
////            guard let cell = tableView.dequeueReusableCell(withIdentifier: TimeWeatherCollectionTableViewCell.identifier, for: indexPath) as? TimeWeatherCollectionTableViewCell else { return UITableViewCell() }
////
////            cell.backgroundColor = .clear
////
////            cell.bindData(section: forecaseSection[indexPath.section])
//            
//            return cell
//        default:
//            return UITableViewCell()
//        }
//    }
//}
//
//
//extension Week3DetailWeatherViewController {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let currentOffset = scrollView.contentOffset.y + scrollView.contentInset.top
////        calculateHeaderViewHeight(for: currentOffset)
//    }
//}
