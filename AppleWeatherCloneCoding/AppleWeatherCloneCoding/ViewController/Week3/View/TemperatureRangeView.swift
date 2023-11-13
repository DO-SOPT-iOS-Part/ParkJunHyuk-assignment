//
//  TemperatureRangeView.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/08.
//

import UIKit
import SnapKit
import Then

class TemperatureRangeView: UIView {
    
    // MARK: - Property
    
    private lazy var totalRangeView = UIView().then {
        $0.backgroundColor = .progressColor
        $0.layer.cornerRadius = 2
    }
    
    private lazy var todayRangeView = UIView()

    private var minTemperature: CGFloat = 12
    private var maxTemperature: CGFloat = 29
    private var todayMinTemperature: CGFloat?
    private var todayMaxTemperature: CGFloat?
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setLayout()
   
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layouts
    
    private func setLayout() {
        
        self.addSubview(totalRangeView)
        self.addSubview(todayRangeView)
                
        totalRangeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        todayRangeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func updateTodayRangeView() {
        let totalWidth = self.bounds.width
        
        guard let todayMinTemp = todayMinTemperature else {return}
        guard let todayMaxTemp = todayMaxTemperature else {return}
        
        let normalizedTodayMin = (todayMinTemp - minTemperature) / (maxTemperature - minTemperature)
        let normalizedTodayMax = (todayMaxTemp - minTemperature) / (maxTemperature - minTemperature)
        
        todayRangeView.snp.remakeConstraints {
            $0.left.equalToSuperview().offset(normalizedTodayMin * totalWidth)
            $0.right.equalToSuperview().offset(-(1 - normalizedTodayMax) * totalWidth)
            $0.top.bottom.equalToSuperview()
        }
        
        todayRangeView.applyGradient(colors: [.rowTemperatureColor, .highTemperatureColor])
    }
    
    // 뷰의 레이아웃이 변경될 때마다 호출됩니다.
    override func layoutSubviews() {
        super.layoutSubviews()
        // 레이아웃 업데이트가 필요할 때마다 오늘의 온도 범위를 업데이트합니다.
        updateTodayRangeView()
    }
    
    func bindData(min: CGFloat, max: CGFloat) {
        self.todayMinTemperature = min
        self.todayMaxTemperature = max
    }
}
