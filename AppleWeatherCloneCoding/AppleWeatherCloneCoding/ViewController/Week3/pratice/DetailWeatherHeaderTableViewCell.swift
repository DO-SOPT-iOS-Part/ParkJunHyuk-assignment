////
////  DetailWeatherHeaderTableViewCell.swift
////  AppleWeatherCloneCoding
////
////  Created by ParkJunHyuk on 2023/11/07.
////
//
//import UIKit
//import Then
//
//class DetailWeatherHeaderTableViewCell: UITableViewCell {
//    
//    // MARK: - Property
//    
//    static let identifier: String = "DetailWeatherHeaderTableViewCell"
//    
//    private var section: Int?
//    
//    private lazy var headerStackView = UIStackView(arrangedSubviews: [headerImage, headerTitle]).then {
//        $0.axis = .horizontal
//        $0.distribution = .fill
//        $0.spacing = 5
//        $0.alignment = .center
//    }
//    
//    private lazy var headerImage = UIImageView().then {
//        $0.image = UIImage(systemName: section == 0 ? "clock" : "calendar")
//        $0.contentMode = .scaleAspectFill
//        $0.tintColor = .headerTitleColor
//    }
//    
//    private var headerTitle = UILabel().then {
//        $0.font = .medium(size: 15)
//        $0.textColor = .headerTitleColor
//    }
//
//    // MARK: - LifeCycle
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .none
//        setLayout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Layout
//    
//    private func setLayout() {
//        
//        self.addSubview(headerStackView)
//        
//        headerStackView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(8)
//            $0.leading.equalToSuperview().offset(15)
//        }
//        
////        [headerImage, headerTitle].forEach {
////            self.addSubview($0)
////        }
////
////        headerImage.snp.makeConstraints {
////            $0.edges.equalToSuperview()
////        }
//    }
//    
////    private func setCollectionViewConfig() {
////        collectionView.register(TimeWeatherDataCollectionViewCell.self, forCellWithReuseIdentifier: TimeWeatherDataCollectionViewCell.identifier)
////    }
////
//    func bindData(section: Int, text: String) {
//        self.section = section
//        self.headerTitle.text = text
//    }
//}
