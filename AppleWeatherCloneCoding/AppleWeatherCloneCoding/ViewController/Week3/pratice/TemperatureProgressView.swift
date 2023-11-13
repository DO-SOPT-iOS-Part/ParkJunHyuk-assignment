////
////  TemperatureProgressView.swift
////  AppleWeatherCloneCoding
////
////  Created by ParkJunHyuk on 2023/11/07.
////
//
//import UIKit
//import Then
//
//final class TemperatureProgressView: UIView {
//
//    // MARK: - Property
//
//    private var fullRangeProgressView = UIProgressView(progressViewStyle: .bar).then {
//        $0.progressTintColor = .progressColor
//    }
//
//    private var todayRangeProgressView = UIProgressView(progressViewStyle: .bar).then {
//        $0.trackTintColor = UIColor.clear
//    }
//
//    private let minTemperature = 10.0
//    private let maxTemperature = 35.0
//
//    // MARK: - LifeCycle
//
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        setLayout()
//        customizeProgressView()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - layouts
//
//    private func customizeProgressView() {
//
//        fullRangeProgressView.layer.cornerRadius = 3
//        fullRangeProgressView.clipsToBounds = true
//
//        todayRangeProgressView.layer.cornerRadius = 3
//        todayRangeProgressView.clipsToBounds = true
//
//    }
//
//    private func setLayout() {
//
////        self.addSubview(progressView)
//
//        self.addSubview(fullRangeProgressView)
//        self.addSubview(todayRangeProgressView)
//
//        fullRangeProgressView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//
//        fullRangeProgressView.setProgress(1.0, animated: false)
//
//        todayRangeProgressView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
//
//    // MARK: - methods
//
//    // 실제 온도 값을 프로그레스 바의 값으로 매핑하는 메소드
////    func setTemperature(_ temperature: Double) {
////        let progress = (temperature - minTemperature) / (maxTemperature - minTemperature)
////        progressView.setProgress(Float(progress), animated: true)
////    }
//
//    func setTodayTemperatureRange(min: Double, max: Double) {
//        let fullRange = maxTemperature - minTemperature
//        let todayLowerProgress = Float((min - minTemperature) / fullRange)
//        let todayUpperProgress = Float((max - minTemperature) / fullRange)
//
//
////        print(CGFloat(todayLowerProgress) * self.bounds.width)
//        // SnapKit을 사용하여 오늘의 온도 범위에 맞게 프로그레스 뷰를 업데이트합니다.
//        todayRangeProgressView.snp.remakeConstraints {
//            $0.left.equalToSuperview().offset(CGFloat(todayLowerProgress) * self.bounds.width)
//            $0.right.equalToSuperview().offset(CGFloat(todayUpperProgress) * self.bounds.width * -1)
//
//            $0.top.bottom.equalToSuperview()
//        }
//        layoutIfNeeded() // 제약조건 업데이트
//        todayRangeProgressView.setProgress(todayUpperProgress, animated: false)
//
//        todayRangeProgressView.applyGradient(colors: [.rowTemperatureColor, .highTemperatureColor])
//    }
//}
