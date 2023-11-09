////
////  TimeWeatherCollectionTableViewCell.swift
////  AppleWeatherCloneCoding
////
////  Created by ParkJunHyuk on 2023/11/03.
////
//
//import UIKit
//import Then
//
//class TimeWeatherCollectionTableViewCell: UITableViewCell {
//
//    // MARK: - Property
//
//    static let identifier: String = "TimeWeatherCollectionTableViewCell"
//
//    private var timeWeatherInfo: [TimeWeatherInfo] = []
//
//    private lazy var collectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: 44 , height: 122)
//        flowLayout.minimumLineSpacing = 22 // cell사이의 간격 설정
//        flowLayout.sectionInset = UIEdgeInsets(top: 14, left: 15, bottom: 10, right: 10)
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout) // 여기에 레이아웃 객체를 전달
//        collectionView.backgroundColor = .clear
//        collectionView.isUserInteractionEnabled = true
//        collectionView.isScrollEnabled = true
//        return collectionView
//    }()
//
//    // MARK: - LifeCycle
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .none
////        self.backgroundColor = .clear
//        setupDelegate()
//        setLayout()
//        setCollectionViewConfig()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - Layout
//
//    private func setupDelegate() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//
//    private func setLayout() {
//        self.addSubview(collectionView)
//
//        collectionView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
//
//    private func setCollectionViewConfig() {
//        collectionView.register(TimeWeatherDataCollectionViewCell.self, forCellWithReuseIdentifier: TimeWeatherDataCollectionViewCell.identifier)
//    }
//
//    func bindData(section: Section) {
//
//
////        self.timeWeatherInfo = section.timeWeatherInfo ??
//    }
//}
//
//
//extension TimeWeatherCollectionTableViewCell: UICollectionViewDelegate { }
//
////extension TimeWeatherCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 1
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 1
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: UIScreen.main.bounds.width, height: 122)
////    }
////}
//
//extension TimeWeatherCollectionTableViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return timeWeatherInfo.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherDataCollectionViewCell.identifier, for: indexPath) as? TimeWeatherDataCollectionViewCell else { return UICollectionViewCell()}
//
//        cell.bindData(timeWeatherInfo: timeWeatherInfo[indexPath.row])
//
//        return cell
//    }
//}
