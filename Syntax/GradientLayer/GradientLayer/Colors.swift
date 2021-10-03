//
//  Colors.swift
//  GradientLayer
//
//  Created by Jaeyoung Lee on 2021/10/03.
//

import Foundation
import UIKit
//컬러- 게이지창 배경색 #FFFCDB / 게이지 그라데이션 #FFB5AF ~ #A29FFF / 도형: 그라데이션 (화이트 ~ 해당 게이지 색) / 메인 컬러: #A29FFF / 메인에서 톤다운 (포인트, 마이페이지와 설정 배경색) #706DD3

let gaugeViewBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.9877024293, blue: 0.8858229518, alpha: 1)
let gaugeViewColorTop: UIColor = #colorLiteral(red: 0.6965150237, green: 0.698797524, blue: 1, alpha: 1)
let gaugeViewColorBottom: UIColor = #colorLiteral(red: 1, green: 0.7658135295, blue: 0.7398825288, alpha: 1)
// MARK: - colors
let gradientColors: [CGColor] = [gaugeViewColorTop.cgColor, gaugeViewColorBottom.cgColor]

var objectColorTop: UIColor?
let objectColorBottom: UIColor = .white


//1. red
//2. orange red
//3. ..
//4 ...
//5. 33

//178 178 255
let convertMain: UIColor = #colorLiteral(red: 0.7510736585, green: 0.7605653405, blue: 1, alpha: 1)
//162 159 255
let mainViewColor: UIColor = #colorLiteral(red: 0.6965150237, green: 0.698797524, blue: 1, alpha: 1)
let mainViewTonDownColor: UIColor = #colorLiteral(red: 0.5151480436, green: 0.5198820829, blue: 0.8611346483, alpha: 1)

extension UIColor {
    // MARK: - From UIColor to String
    func hexStringFromColor() -> String {
        let components = self.cgColor.components
        
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "0x%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
     }
}
