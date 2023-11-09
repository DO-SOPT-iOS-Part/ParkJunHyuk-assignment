//
//  DetailWeather3ViewController.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/09.
//

import UIKit
import SnapKit

class Week3DetailWeatherViewController: UIViewController {

    // MARK: - Property
    
    private(set) var identifier = 0
    private var forecastSection: [Section] = []
    private var headerInfo: HeaderInfo?

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout()).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.clipsToBounds = true
    }
    
    private var backgroundView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "BackgroundImage"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var detailWeatherHeaderView = DetailWeatherHeaderView()
    
    // AutoLayout 조정을 위한 Constraint
    private var headerHeight: CGFloat?
    private var headerHeightConstraint: Constraint?
    private var headerBottomConstraint: Constraint?
    private var headerTopConstraint: Constraint?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setLayout()
        setCollectionViewConfig()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //detailWeatherHeaderView의 높이
        headerHeight = detailWeatherHeaderView.frame.height
    }
    
    // MARK: - layouts
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setLayout() {
        
        [backgroundView, detailWeatherHeaderView, collectionView].forEach {
            self.view.addSubview($0)
        }
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailWeatherHeaderView.snp.makeConstraints {
            self.headerTopConstraint = $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(34).constraint
            $0.leading.trailing.equalToSuperview()
            self.headerBottomConstraint = $0.bottom.equalTo(collectionView.snp.top).inset(-44).constraint
            self.headerHeightConstraint = $0.height.equalTo(212).constraint
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    /// CollectionView 에 사용할 Cell a및 ReusableView
    private func setCollectionViewConfig() {
        collectionView.register(TimeWeatherDataCollectionViewCell.self, forCellWithReuseIdentifier: TimeWeatherDataCollectionViewCell.identifier)
        
        collectionView.register(DailyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DailyWeatherCollectionViewCell.identifier)
        
        collectionView.register(StickyHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StickyHeaderCollectionReusableView.identifier)
    }
    
    func bindData(forecaseInfo: ForecastInfo, identifier: Int) {
        self.identifier = identifier
        self.forecastSection = forecaseInfo.sections
        
        detailWeatherHeaderView.bindData(headerInfo: forecaseInfo.headerInfo)
        
        self.headerInfo = forecaseInfo.headerInfo
    }
}

// MARK: - extension

/// UICollectionView Compositional Layout 으로 구현
extension Week3DetailWeatherViewController {
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return self.createFirstSectionLayout()
            case 1:
                return self.createSecondSectionLayout()
            default:
                return nil
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20 // Section 간격
        
        // 레이아웃에 배경과 간격을 적용
        layout.configuration = config
        layout.register(SectionBackgroundCollectionReusableView.self, forDecorationViewOfKind: SectionBackgroundCollectionReusableView.kind)
        return layout
    }
    
    private func createFirstSectionLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(66),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 7)

        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(66),
            heightDimension: .absolute(122))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous // 수평 스크롤
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
    
        // sticky header 설정
        header.pinToVisibleBounds = true
        
        // section 에 header 설정
        section.boundarySupplementaryItems = [header]
        
    
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundCollectionReusableView.kind)
            section.decorationItems = [backgroundItem]
        
        return section
    }
    
    private func createSecondSectionLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(55))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(55))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        // sticky header 설정
        header.pinToVisibleBounds = true
        
        // section 에 header 설정
        section.boundarySupplementaryItems = [header]
        
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundCollectionReusableView.kind)
            section.decorationItems = [backgroundItem]
        
        
        return section
    }
}

extension Week3DetailWeatherViewController: UICollectionViewDelegate {}


extension Week3DetailWeatherViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 섹션 수 반환
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 섹션별 아이템 수 반환
        switch section {
        case 0:
            let section = forecastSection[section]
            return section.timeWeatherInfo?.count ?? 0
        case 1:
            let section = forecastSection[section]
            return section.dailyWeatherInfo?.count ?? 0
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherDataCollectionViewCell.identifier, for: indexPath) as? TimeWeatherDataCollectionViewCell else { return UICollectionViewCell()}
            
            let section = forecastSection[indexPath.section]
            
            if let timeInfo = section.timeWeatherInfo?[indexPath.item] {
                cell.bindData(timeWeatherInfo: timeInfo)
            }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyWeatherCollectionViewCell.identifier, for: indexPath) as? DailyWeatherCollectionViewCell else { return UICollectionViewCell()}
            
            let section = forecastSection[indexPath.section]
            
            if let dailyInfo = section.dailyWeatherInfo?[indexPath.item] {
                cell.bindData(dailyWeatherInfo: dailyInfo)
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    // 각 Section 의 Header 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StickyHeaderCollectionReusableView.identifier, for: indexPath) as! StickyHeaderCollectionReusableView

        switch indexPath.section {
        case 0:
            sectionHeader.bindData(section: 0, text: "시간별 일기예보")
            return sectionHeader
        case 1:
            sectionHeader.bindData(section: 1, text: "10일간의 일기예보")
            return sectionHeader
        default:
            return UICollectionReusableView()
        }
        
    }
}

// Scroll 시
extension Week3DetailWeatherViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let yOffset = scrollView.contentOffset.y
        
        let newHeight = max(65.0, 212 - yOffset + 44) // 높이가 특정 최소값 이하로 줄어들지 않도록 조정

        DispatchQueue.main.async {
            self.detailWeatherHeaderView.updateView(forScrollOffset: yOffset)

            if yOffset < 24 {
                self.headerTopConstraint?.update(offset: 34 - yOffset)
                self.headerBottomConstraint?.update(inset: yOffset - 44)
            }
            else if yOffset < 44 {
                self.headerBottomConstraint?.update(inset: yOffset - 44)
            } else {
                self.headerHeightConstraint?.update(offset: newHeight)
            }
            self.view.layoutIfNeeded() // 레이아웃을 즉시 업데이트합니다.
        }
    }
}
